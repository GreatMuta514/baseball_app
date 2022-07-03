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
    document.getElementById('submitted_chat_content').
    insertAdjacentHTML('beforeend', date['chat'])
  }
});
