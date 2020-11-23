class RoomMessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
