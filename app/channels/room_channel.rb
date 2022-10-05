class RoomChannel < ApplicationCable::Channel
  def subscribed
    @chatroom = Chatroom.find(params[:chatroom_id])
    reject if @chatroom.nil?
    stream_for "room_channel_#{params[:chatroom_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_stream_for "room_channel_#{params[:chatroom_id]}"
  end
end
