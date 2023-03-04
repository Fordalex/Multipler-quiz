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

      if (action == 'select answer') {
        displayOptions(data['question_options'].split(','));
        displayWaitingForPlayers();
      }

      if (action == 'player answered') {
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

  if (everyoneHasAnswered()) {
    displayResults();
  }
}

function displayOptions(options) {
  correctAnswer = options[3];

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
