import consumer from "./consumer"
import playerJoinedSound from '../../assets/audio/player_joined.flac'


document.addEventListener("DOMContentLoaded", function (event) {
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
      const audio = new Audio(playerJoinedSound);
      audio.play();

      console.log(data)

      window.players.value = data['players']
    }
  });
});
