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

  // clear question options
  let questionOptions = document.getElementById('question_options');
  questionOptions.value = '';

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

// questioner

function setupQuestioner(data) {
  displayOptions(data['options'].split(','));
  addQuestionerOptionsEventListeners();
}

function displayOptions(options) {
  let questionOptions = document.getElementById('questionOptions');
  options = options.map((option) => {
    return `<li>${option}</li>`
  }).join('')

  questionOptions.innerHTML = options;
}

function addQuestionerOptionsEventListeners() {
  let selected = 0;
  let options = document.querySelectorAll('#questionOptions li');

  options.forEach((option) => {
    option.addEventListener('click', (e) => {
      selected++;
      let questionOptionsInput = document.getElementById('question_options');

      if (selected <= 3) {
        option.classList.add('selected-decoy');
        questionOptionsInput.value = questionOptionsInput.value + option.innerText + ',';

      } else if (selected == 4) {
        option.classList.add('selected');
        questionOptionsInput.value = questionOptionsInput.value + option.innerText
        let submitButton = document.getElementById('questionerSubmitButton');
        submitButton.classList.remove('d-none');
      }
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
