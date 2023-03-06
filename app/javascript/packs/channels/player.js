// TODO why do I have to create this channels folder in app/javascript/packs?
// Literally can't get these to load individually without it.

import consumer from "../../channels/consumer"

let playersName;

document.addEventListener("DOMContentLoaded", function (event) {
  playersName = document.getElementById('playersName').innerText;

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

      if (action == 'start quiz') {
        startQuiz(data);
      }

      if (action == 'select answer') {
        selectAnswer(data);
      }

      if (action == 'everyone has answered') {
        clearDisplay();
        displayReadyButton();
      }
    }
  });
});

// life cycle

function startQuiz(data) {
  let waitingMessage = document.getElementById('waitingMessage');
  if (waitingMessage) { waitingMessage.remove() }

  // set current question
  let question = document.getElementById('question');
  question.innerHTML = data['question'];

  // clear correct answer
  let correctAnswers = document.getElementById('correct_answer');
  correctAnswers.value = '';

  // clear incorrect answers
  let incorrectAnswers = document.getElementById('incorrect_answers');
  incorrectAnswers.value = '';

  clearDisplay();

  // set up player
  if (playersName == data['questioner']) {
    setupQuestioner(data)
  } else {
    setupAnswerer(data)
  }
}

function selectAnswer(data) {
  clearDisplay();

  if (playersName == data['questioner']) {
    let questionOptions = document.getElementById('questionOptions');
    questionOptions.innerHTML = '';
  } else {
    displayOptions(data['question_options'].split(','));
    addAnswererOptionsEventListeners();
  }
}

// generic

function clearDisplay() {
  // clear message container
  let messageContainer = document.getElementById('messageContainer');
  messageContainer.innerHTML = '';

  // clear question options
  let questionOptions = document.getElementById('questionOptions');
  questionOptions.innerHTML = '';

  // hide questioner submit button
  let questionerSubmitButton = document.getElementById('questionerSubmitButton');
  questionerSubmitButton.classList.add('d-none');

  // hide answerer submit button
  let answererSubmitButton = document.getElementById('answererSubmitButton');
  answererSubmitButton.classList.add('d-none');

  // hide ready button
  let readyButton = document.getElementById('playerReadyButton');
  readyButton.classList.add('d-none');
}

function displayReadyButton() {
  let readyButton = document.getElementById('playerReadyButton');
  readyButton.classList.remove('d-none');
}

function displayOptions(options) {
  let questionOptions = document.getElementById('questionOptions');
  options = options.map((option) => {
    return `<li>${option}</li>`
  }).join('')

  questionOptions.innerHTML = options;
}

// questioner

function setupQuestioner(data) {
  displayOptions(data['options'].split(','));
  addQuestionerOptionsEventListeners();
}

let selectedCorrectAnswer = false;
let incorrectAnswers = 0;

function displayHUDMessage() {
  let HUDMessages = document.querySelectorAll('[data-player-hud-info]');
  HUDMessages.forEach((m) => { m.classList.add('d-none') });
  let submitButton = document.getElementById('questionerSubmitButton');
  submitButton.classList.add('d-none');

  if (selectedCorrectAnswer == false) {
    let correctAnswerHUD = document.querySelector('[data-player-hud-info=correct]');
    correctAnswerHUD.classList.remove('d-none');
    return
  }

  if (incorrectAnswers < 3) {
    let incorrectAnswerHUD = document.querySelector('[data-player-hud-info=incorrect]');
    incorrectAnswerHUD.classList.remove('d-none');
    return
  }

  if (selectedCorrectAnswer == true && incorrectAnswers == 3) {
    let doneHUD = document.querySelector('[data-player-hud-info=done]');
    doneHUD.classList.remove('d-none');
    submitButton.classList.remove('d-none');
    return
  }
}

function updateCorrectAnswerOption(option) {
  let questionOptions = document.getElementById('correct_answer');
  questionOptions.value = option;
}

function updateIncorrectAnswerOption(option, action) {
  let incorrect_answers = document.getElementById('incorrect_answers');
  let options = incorrect_answers.value.split(',');

  if (action == 'add') {
    options.push(option);
  } else {
    let index = options.indexOf(option);
    options.splice(index, 1);
  }

  incorrect_answers.value = options.join(',');
}

function addQuestionerOptionsEventListeners() {
  let options = document.querySelectorAll('#questionOptions li');

  options.forEach((option) => {
    option.addEventListener('click', (e) => {
      // deselect option
      if (option.classList.contains('selected') || option.classList.contains('selected-decoy')) {
        if (option.classList.contains('selected')) {
          selectedCorrectAnswer = false;
          option.classList.remove('selected');
        }

        if (option.classList.contains('selected-decoy')) {
          incorrectAnswers--;
          option.classList.remove('selected-decoy');
          updateIncorrectAnswerOption(option.innerText, 'remove');
        }
      } else {
        // select option
        if (selectedCorrectAnswer == true && incorrectAnswers == 3) { return }

        if (!selectedCorrectAnswer) {
          selectedCorrectAnswer = true;
          option.classList.add('selected');
          updateCorrectAnswerOption(option.innerText);
        } else {
          option.classList.add('selected-decoy');
          incorrectAnswers++;
          updateIncorrectAnswerOption(option.innerText, 'add');
        }
      }

      let playerHUDIncorrect = document.getElementById('playerHUDIncorrect');
      playerHUDIncorrect.innerHTML = incorrectAnswers;
      displayHUDMessage();

      // TODO selecting the correct answer and the incorrect answers should be separate.

      // if (option.classList.contains('selected') || option.classList.contains('selected-decoy')) {
      //   selected--;
      //   option.classList.remove('selected');
      //   option.classList.remove('selected-decoy');
      //   // TODO remove from question_options input
      // } else {
      //   selected++;
      //   let questionOptionsInput = document.getElementById('question_options');

      //   if (selected == 1) {
      //     let correctAnswerHUD = document.querySelector('[data-player-hud-info=correct]');
      //     correctAnswerHUD.classList.add('d-none');

      //     let incorrectAnswerHUD = document.querySelector('[data-player-hud-info=incorrect]');
      //     incorrectAnswerHUD.classList.remove('d-none');

      //     option.classList.add('selected');
      //     questionOptionsInput.value = questionOptionsInput.value + option.innerText + ',';
      //   }

      //   if (selected > 1 && selected < 4) {
      //     option.classList.add('selected-decoy');
      //     questionOptionsInput.value = questionOptionsInput.value + option.innerText + ',';

      //   } else if (selected == 4) {
      //     option.classList.add('selected-decoy');
      //     questionOptionsInput.value = questionOptionsInput.value + option.innerText
      //     let submitButton = document.getElementById('questionerSubmitButton');
      //     submitButton.classList.remove('d-none');
      //   }
      // }

      // updateHUD(selected);
    });
  });
}

// answerer

function setupAnswerer(data) {
  let messageContainer = document.getElementById('messageContainer');
  messageContainer.innerHTML = `Waiting for ${data['questioner']} to select the options.`;
}

function addAnswererOptionsEventListeners() {
  let options = document.querySelectorAll('#questionOptions li');

  options.forEach((option) => {
    option.addEventListener('click', (e) => {
      options.forEach((o) => { o.classList.remove('selected') });
      option.classList.add('selected');

      let selected_answer = document.getElementById('selected_answer');
      selected_answer.value = option.innerText;
      let answererSubmitButton = document.getElementById('answererSubmitButton');
      answererSubmitButton.classList.remove('d-none');
    });
  });
}
