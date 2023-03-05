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

      playerJoinedSound.play();

      const userList = document.getElementById('userList');
      userList.innerHTML = '';

      let players_names = '';
      data['players'].forEach((player) => {
        let playerIcon = playerIconStyle.replace('templateName', player['name'])
        playerIcon = playerIcon.replaceAll('templateColour', player['colour'])
        playerIcon = playerIcon.replace(/cool-.+\.png/, player['avatar'])
        console.log(playerIcon)
        players_names += playerIcon;
      })

      userList.innerHTML = players_names;
    }
  });
});
