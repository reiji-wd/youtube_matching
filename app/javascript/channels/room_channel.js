import consumer from "./consumer"
$(function() {

  const chatRoom = consumer.subscriptions.create({ channel: "RoomChannel", room: $('#room').data('room_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      const el = document.querySelector('#user_id');
      const user_id = Number(el.getAttribute('data-user-id'));

      if (user_id === data.message.user_id) {
        var html = data.mine
      } else {
        var html = data.theirs
      }

      $('.messages').append(html);
      // Called when there's incoming data on the websocket for this channel
    },
  
    speak: function(content) {
      // debugger
      return this.perform('speak', { content: content });
    }
  });
  
    const btn = document.querySelector('.message-btn');
    const text = document.querySelector('.message-text');
    btn.addEventListener('click', function() {
      const message = text.value;
      chatRoom.speak(message);
      text.value = '';
    });
  
});
