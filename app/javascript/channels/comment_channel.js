import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const who = `<p><span class="comment-people">${data.who}</span>      `;
    const text = `<span class="comment-text">${data.content}</span>     `;
    const time = `<span class="comment-created">${data.time}</span></p><br>`;
    const comments = document.getElementById('comments'); 
    const newComment = document.getElementById('comment_text');
    
    comments.insertAdjacentHTML('afterbegin', who + text + time);
    newComment.value='';
  }
});
