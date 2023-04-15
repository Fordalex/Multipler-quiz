import consumer from "./consumer"
import displayQuestionSound from '../../assets/audio/display_question.mp3'
import selectAnswerSound from '../../assets/audio/countdown.wav'
import displayAnswersSound from '../../assets/audio/display_answers.wav'
import getReadySound from '../../assets/audio/get_ready.wav'

let correctAnswer;

document.addEventListener("DOMContentLoaded", function (event) {
  const room_id = document.getElementById('roomId').dataset.roomId;
  const startAnswerAudio = new Audio(displayQuestionSound);
  const displayQuestionAudio = new Audio(displayQuestionSound);
  const getReadyAudio = new Audio(getReadySound);
  const selectAnswerAudio = new Audio(selectAnswerSound);
  const displayAnswersAudio = new Audio(displayAnswersSound);
  displayQuestionAudio.play();

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
        startAnswerAudio.play();
        correctAnswer = data['correct_answer'];
        displayOptions(data['question_options'].split(','));
        displayWaitingForPlayers();
      }

      if (action == 'get ready') {
        getReadyAudio.play();
      }

      if (action == 'player answered') {
        var sound = document.getElementById("playerAnsweredSound");
        var clone = sound.cloneNode();
        clone.play();
        playerAnswered(data)
      }

      if (action == 'everyone has answered') {
        selectAnswerAudio.pause();
        displayAnswersAudio.play();
        displayResults();
      }

      if (action == 'start quiz') {
        window.currentRound.value = data['current_round'];
        playersAnswers = [];
        displayQuestionAudio.play();
        setupTheQuestion(data);
      }

      if (action == 'quiz finished') {
        displayModal()
      }
    }
  });
});

// life cycle

function setupTheQuestion(data) {
  let displayQuestion = document.getElementById('displayQuestion');
  displayQuestion.innerHTML = data['question'];

  let questionOptions = document.getElementById('questionOptions');
  questionOptions.innerHTML = '';
}

let playersAnswers = [];

function playerAnswered(data) {
  let player = document.querySelector(`[data-player="${data['player_answered']}"]`);
  let timeTaken = parseFloat(data['time_taken_to_answer']).toFixed(3)
  player.innerHTML = ` - ${timeTaken}s'`;
  player.dataset.playerAnswer = data['selected_answer'];
  player.dataset.timeTaken = timeTaken;

  let playersAnswerInfo = {
    name: data['player_answered'],
    answer: data['selected_answer'],
    time: timeTaken,
    colour: data['colour']
  }
  playersAnswers.push(playersAnswerInfo);
}

function displayOptions(options) {
  let questionOptions = document.getElementById('questionOptions');
  options = options.map((option) => {
    return `<div class="option-container"><li data-option="${option}">${option}</li></div>`
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

function displayResults() {
  let correctOption = document.querySelector(`[data-option="${correctAnswer}"]`);
  correctOption.classList.add('correct');

  let playerNames = document.querySelectorAll('[data-player]');
  playerNames.forEach((player) => {
    player.innerHTML = ' - ' + player.dataset.playerAnswer + ' - ' + player.dataset.timeTaken + 's';
  });

  playersAnswers.forEach((player) => {
    let option = document.querySelector(`[data-option="${player['answer']}"]`);
    let playerInfo = `
      <div class='answered-playerInfo' style='background-color:${player['colour']};'>
        <p>${player['name']}</p>
      </div>`
    ;
    option.insertAdjacentHTML("afterend", playerInfo);
  });
}

function displayModal() {
   var myModal = new bootstrap.Modal(document.getElementById("exampleModal"), {
    keyboard: false,
    backdrop: 'static'
  });
  myModal.show();
}
