import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
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

      console.log(data)
      if (data['status'] == 'start') {
        let waitingMessage = document.getElementById('waitingMessage');
        waitingMessage.remove()
      }
    }
  });
});
