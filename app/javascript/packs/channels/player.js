// TODO why do I have to create this channels folder in app/javascript/packs?
// Literally can't get these to load individually without it.

import consumer from "../../channels/consumer"

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
      let waitingMessage = document.getElementById('waitingMessage');
      if (waitingMessage) { waitingMessage.remove() }

      // set current question
      let question = document.getElementById('question');
      question.innerHTML = data['question'];

      // clear message container
      let messageContainer = document.getElementById('messageContainer');
      messageContainer.innerHTML = '';

      // clear question options
      let questionOptions = document.getElementById('questionOptions');
      questionOptions.innerHTML = '';

      // set up player
      let playersName = document.getElementById('playersName').innerText;
      if (playersName == data['questioner']) {
       setupQuestioner(data)
      } else {
        setupAnswerer(data)
      }
    }
  });
});

function setupQuestioner(data) {
  let options = data['options'].split(',');
  options = options.map((option, index) => {
    return `<li>${index + 1}. ${option}</li>`
  }).join('')
  let questionOptions = document.getElementById('questionOptions');
  questionOptions.innerHTML = options;
}

function setupAnswerer(data) {
  let messageContainer = document.getElementById('messageContainer');
  messageContainer.innerHTML = `Waiting for ${data['questioner']} to select the options.`;
}
