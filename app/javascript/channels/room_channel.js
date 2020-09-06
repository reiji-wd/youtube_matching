import consumer from "./consumer"

$(function() {
  consumer.subscriptions.create({ channel: "RoomChannel", room: $('#room').data('room_id') }, {
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
      return this.perform('speak',);
    }
  });
});

