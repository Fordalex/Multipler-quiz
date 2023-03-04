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
      const userList = document.getElementById('userList');
      userList.innerHTML = '';

      let players_names = '';
      data['players'].forEach((player) => {
        players_names += `<li>${player}</li>`
      })

      userList.innerHTML = players_names
    }
  });
});
