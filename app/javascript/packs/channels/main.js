// TODO why do I have to create this channels folder in app/javascript/packs?
// Literally can't get these to load individually without it.

import consumer from "../../channels/consumer"

let correctAnswer;

document.addEventListener("DOMContentLoaded", function(event) {
  const room_id = document.getElementById('roomId').dataset.roomId;

  consumer.subscriptions.create({
      channel: "RoomChannel",
      room_id: room_id
    },
    {
    connected() {
      console.log('connected to room channel')
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data)
      let action = data['action'];

      // TODO the action names are not very descriptive
      if (action == 'select answer') {
        selectAnswerSound.play();
        correctAnswer = data['correct_answer'];
        displayOptions(data['question_options'].split(','));
        displayWaitingForPlayers();
      }

      if (action == 'player answered') {
        playerAnsweredSound.play();
        playerAnswered(data)
      }
    }
  });
});

// life cycle

function playerAnswered(data) {
  let player = document.querySelector(`[data-player="${data['player_answered']}"]`);
  player.innerHTML = ' - Answered';
  player.dataset.playerAnswer = data['selected_answer'];
  player.dataset.timeTaken = data['time_taken_to_answer'];

  // move this logic to the controller and add a new action instead.
  if (everyoneHasAnswered()) {
    selectAnswerSound.pause();
    displayAnswersSound.play();
    displayResults();
  }
}

function displayOptions(options) {
  let questionOptions = document.getElementById('questionOptions');
  options = options.map((option) => {
    return `<li data-option="${option}">${option}</li>`
  }).join('')

  questionOptions.innerHTML = options;
}

function displayWaitingForPlayers() {
  let playerNames = document.querySelectorAll('[data-player]');
  console.log(playerNames)
  playerNames.forEach((player) => {
    player.innerHTML = ' - Waiting for answer';
  });
}

// generic

function everyoneHasAnswered() {
  let playerNames = document.querySelectorAll('[data-player]');
  let everyoneAnswered = true;

  playerNames.forEach((player) => {
    if (player.dataset.playerAnswer == '') {
      everyoneAnswered = false;
    }
  });

  return everyoneAnswered;
}

function displayResults() {
  let correctOption = document.querySelector(`[data-option="${correctAnswer}"]`);
  correctOption.classList.add('correct');

  let playerNames = document.querySelectorAll('[data-player]');
  playerNames.forEach((player) => {
    player.innerHTML = ' - ' + player.dataset.playerAnswer;
  });
}
