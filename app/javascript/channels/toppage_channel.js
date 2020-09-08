import consumer from "./consumer"

consumer.subscriptions.create("ToppageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // const posts = document.querySelector('.posts');
    // posts.insertAdjacentHTML('afterbegin', data['post']);
//     const el = document.querySelector('#user_id');
//     const user_id = Number(el.getAttribute('data-user-id'));

//     if (user_id === data.post.user_id) {
//       var html = data.mine
//     } else {
//       var html = data.theirs
//     }

// 　　$('.posts').prepend(html);
    // Called when there's incoming data on the websocket for this channel
  },

  tweet: function(content) {
    return this.perform('tweet', {post: content});
  }
});




