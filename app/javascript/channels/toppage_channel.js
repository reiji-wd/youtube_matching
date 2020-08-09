import consumer from "./consumer"

const toppageChannel = consumer.subscriptions.create("ToppageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // const posts = document.querySelector('.posts');
    // posts.insertAdjacentHTML('afterbegin', data['post']);
　　$('.posts').prepend(data['post']);
    // Called when there's incoming data on the websocket for this channel
  },

  tweet: function(content) {
    return this.perform('tweet', {post: content});
  }
});

document.addEventListener('DOMContentLoaded', function(){
  const text = document.querySelector('.post-text');
  const btn = document.querySelector('.post-btn') ;
  btn.addEventListener('click', function(){
  const post = text.value;
  // debugger
  toppageChannel.tweet(post)
  text.value = '';
  });
});



