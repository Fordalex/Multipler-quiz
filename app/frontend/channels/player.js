import consumer from "./consumer"

let playersName;
let questioner = false;
let selectedCorrectAnswer = false;
let incorrectAnswersQuestionLimit = 0;
let incorrectAnswers = 0;
let action;

document.addEventListener("DOMContentLoaded", function (event) {
  playersName = document.getElementById('playersName').innerText;
  const room_id = document.getElementById('roomId').dataset.roomId;
  // TODO need to be able to setupQuiz() for here to allow users to refresh their page.
  // The problem is that there will be no data to pass into the function.
  // Maybe store this information in the database and then pull it out when the page loads?

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

      action = data['action'];
      setupQuiz(data);
    }
  });
});

function setupQuiz(data) {
  if (action == 'start quiz') {
    questioner = (playersName.toLowerCase() == data['questioner'].toLowerCase());
    startQuiz(data);
  }

  if (action == 'select answer') {
    selectAnswer(data);
  }

  if (action == 'everyone has answered') {
    clearDisplay();
    HUDDisplayInfo('confirm ready')
    displayReadyButton();
  }
}

function startQuiz(data) {
  let waitingMessage = document.getElementById('waitingMessage');
  if (waitingMessage) { waitingMessage.remove() }

  // set current question
  displayCurrentQuestion(data['question']);

  // clear answers in inputs
  document.getElementById('correct_answer').value = '';
  document.getElementById('incorrect_answers').value = '';

  // set incorrect answers limit
  let incorrectAnswerLimit = document.getElementById('playerHUDIncorrectLimit');
  incorrectAnswersQuestionLimit = data['incorrect_answer_limit'];
  incorrectAnswerLimit.innerHTML = incorrectAnswersQuestionLimit

  clearDisplay();
  setupPlayers(data);
}

function displayCurrentQuestion(question) {
  let questionElement = document.getElementById('question');

  if (questioner) {
    questionElement.innerHTML = question.replace(`${playersName}'s`, 'your');
  } else {
    questionElement.innerHTML = question;
  }
}

function selectAnswer(data) {
  clearDisplay();

  if (questioner) {
    document.getElementById('questionOptions').innerHTML = '';
    HUDDisplayInfo('wait for players to answer')
  } else {
    HUDDisplayInfo('select your answer')
    displayOptions(data['question_options'].split(','));
    addAnswererOptionsEventListeners();
  }
}

// generic

function clearDisplay() {
  // TODO: I think this can get removed soon.

  selectedCorrectAnswer = false;
  incorrectAnswers = 0;

  // clear question options
  document.getElementById('questionOptions').innerHTML = '';

  // TODO: create a function to display the correct submit button.
  // hide questioner submit button
  document.getElementById('questionerSubmitButton').classList.add('d-none');

  // hide answerer submit button
  document.getElementById('answererSubmitButton').classList.add('d-none');

  // hide ready button
  document.getElementById('playerReadyButton').classList.add('d-none');

  updateHUD();
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

function setupPlayers(data) {
  if (questioner) {
    setupQuestioner(data);
  } else {
    HUDDisplayInfo('waiting for options to be selected');
  }
}

function setupQuestioner(data) {
  displayOptions(data['options'].split(','));
  addQuestionerOptionsEventListeners();
}

function updateHUD() {
  let HUDMessages = document.querySelectorAll('[data-player-hud-info]');
  HUDMessages.forEach((m) => { m.classList.add('d-none') });

  if (questioner) {
    displayQuestionerHUD();
  } else {
    HUDDisplayInfo('waiting for options to be selected');
  }
}

function displayQuestionerHUD() {
  let submitButton = document.getElementById('questionerSubmitButton');
  submitButton.classList.add('d-none');

  if (selectedCorrectAnswer == false) {
    HUDDisplayInfo('correct');
    return
  }

  if (incorrectAnswers < incorrectAnswersQuestionLimit) {
    HUDDisplayInfo('incorrect');
    return
  }

  if (selectedCorrectAnswer == true && incorrectAnswers == incorrectAnswersQuestionLimit) {
    HUDDisplayInfo('done');
    submitButton.classList.remove('d-none');
    return
  }
}

function HUDDisplayInfo(message) {
  let HUDMessages = document.querySelectorAll('[data-player-hud-info]');
  HUDMessages.forEach((m) => { m.classList.add('d-none') });

  let HUDMessage = document.querySelector(`[data-player-hud-info="${message}"]`);
  HUDMessage.classList.remove('d-none');
}

function updateCorrectAnswerOption(option) {
  let questionOptions = document.getElementById('correct_answer');
  questionOptions.value = option;
}

function updateIncorrectAnswerOption(option, control) {
  let incorrect_answers = document.getElementById('incorrect_answers');
  let options = incorrect_answers.value.split(',');

  if (control == 'add') {
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
        if (selectedCorrectAnswer == true && incorrectAnswers == incorrectAnswersQuestionLimit) { return }

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
      updateHUD();
    });
  });
}

// answerer

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
