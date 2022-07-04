import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  window.chatContainer = document.getElementById('chat_container')
  if (chatContainer === null) {
    return false
  };

  //actioncable全般
  consumer.subscriptions.create("RoomChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // データを受け取った時に以下を発動する
      document.getElementById('chat_container').
      insertAdjacentHTML('beforeend', data['chat'])
    }
  });
    
    //定数定義
    const submittingChatContent = document.getElementById('submitting_chat_content');
    const chatButton = document.getElementById('chat_button');

    //chatroom開いた時に実行
    window.scrollToBottom = ()=>{
      window.scroll(0,document.documentElement.scrollHeight)
    };
    window.scrollToBottom();
   

    const button_activation = () => {
      if (submittingChatContent.value === ''){
        chatButton.classList.add('disabled')
      } else {
        chatButton.classList.remove('disabled')
      }
    };
    //チャット入力欄に値が入った時
    submittingChatContent.addEventListener('input', () => {
      button_activation()
    });

    chatButton.addEventListener('click', () => {
      chatButton.classList.add('disabled')
    });

});

