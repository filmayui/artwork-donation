class RoomMessagesController < ApplicationController

  def create
    @room_message = RoomMessage.new(room_message_params)
    

    if @room_message.valid?
      @room_message.save

      #コメントの本文、アーティスト名、現在の日時情報を設定し非同期通信
      ActionCable.server.broadcast 'room_message_channel', message_text: @room_message.text, message_artist: @room_message.artist.artist_name, message_time: @room_message.created_at.strftime("%Y/%m/%d %H:%M:%S")

    else

      redirect_to donation_project_room_path(@room_message.artist.donation_project.id)
    end
  end

  def room_message_params
    params.require(:room_message).permit(:text).merge(artist_id: current_user.artist.id, donation_project_room_id: params[:donation_project_room_id]) 
  end

end

