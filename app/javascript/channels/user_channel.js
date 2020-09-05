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
      var el = document.querySelector('.new-notice');
      var otherel = document.querySelector('.new-notice-count')
      var newNotice = el.text;
      if(otherel == undefined) {
        newNotice = "1";
        el.innerHTML = `<div class="new-notice-count">${newNotice}</div>`
      } else {
        var counts = Number(otherel.textContent);
        counts += 1;
        String(counts);
        otherel.textContent = counts;
      }
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
