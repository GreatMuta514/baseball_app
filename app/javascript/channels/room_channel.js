import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  // create.js.erbで使うので定義しておく
  window.chatContainer = document.getElementById('chat_container');

  // 以下のプログラムが他のページで動作しないようにする
  if (chatContainer === null) {
    return false
  };

  const channel = "RoomChannel"
  const data = document.getElementById('data').dataset;
  const chatroomId = data.chatroomId;
  const userId = data.userId;
  //actioncable全般
    consumer.subscriptions.create(
      { 
        channel: channel, chatroom_id: chatroomId, user_id: userId
      },
      {
        connected() {
          // Called when the subscription is ready for use on the server
        },
      
        disconnected() {
          // Called when the subscription has been terminated by the server
          
        },
      
        received(data) {
          // データを受け取った時に以下を発動する
          document.getElementById('chat_container').insertAdjacentHTML('beforeend', data['chat']);
          scrollToBottom();
        }
      }
    );
  
    //定数定義
    const submittingChatContent = document.getElementById('submitting_chat_content');
    const chatButton = document.getElementById('chat_button');

    //chatroom開いた時に画面一番下にスクロール
    window.scrollToBottom = ()=>{
      window.scroll(0,document.documentElement.scrollHeight)
    };
    window.scrollToBottom();

    //チャットのフォームのボタンに関する処理
    const button_activation = () => {
      if (submittingChatContent.value === '' || submittingChatContent.value.length > 100){
        chatButton.classList.add('disabled')
      } else {
        chatButton.classList.remove('disabled')
      }
    };

    submittingChatContent.addEventListener('input', () => {
      button_activation()
    });

    chatButton.addEventListener('click', () => {
      chatButton.classList.add('disabled');
    });
});