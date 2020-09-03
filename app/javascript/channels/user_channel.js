import consumer from "./consumer"

consumer.subscriptions.create("UserChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if(data.notice) {
      $('#notices').prepend(data.notice);
      var newNoticeCount = document.querySelector('.new-notice-count')
      newNoticeCount.innerHTML = "<i class='fas fa-circle'></i>"
    }
    
    if(data.request) {
      $('#requests').prepend(data.request);
    }

    if(data.post) {
      if(data.mine) {
        var html = data.mine
      }
      if(data.theirs) {
        var html = data.theirs
      }
      $('.posts').prepend(html);
    }
    


    // Called when there's incoming data on the websocket for this channel
  }
});
