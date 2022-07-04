import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('test')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // データを受け取った時に以下を発動する
    document.getElementById('chat_index').
    insertAdjacentHTML('beforeend', data['chat'])
  }
});
