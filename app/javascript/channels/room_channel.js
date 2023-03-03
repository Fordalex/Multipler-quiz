import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

  const room_id = document.getElementById('roomId').dataset.roomId;

  consumer.subscriptions.create({
      channel: "RoomChannel",
      room_id: room_id
    },
    {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log('connected to room channel')
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data)

      const userList = document.getElementById('userList');

      let players_names = ''
      data['players'].forEach((player) => {
        players_names += `<li>${player}</li>`
      })

      userList.innerHTML = players_names

    }
  });
});
