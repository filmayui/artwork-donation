import consumer from "./consumer"

consumer.subscriptions.create("RoomMessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const message_artist = `<p><span class="room-message-people">${data.message_artist}</span>       `;
    const message_text = `<span class="room-message-text">${data.message_text}</span>      `;
    const message_time = `<span class="room-message-created">${data.message_time}</span></p><br>`;
    const room_messages = document.getElementById('room-messages'); 
    const newRoomMessage = document.getElementById('room_message_text');
    
    room_messages.insertAdjacentHTML('afterbegin', message_artist + message_text + message_time);
    newRoomMessage.value='';
  }
});
