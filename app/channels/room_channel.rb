class RoomChannel < ApplicationCable::Channel
  def subscribed
    @user = User.find(params[:user_id])
    reject if @user.nil?
    @chatroom = Chatroom.find(params[:chatroom_id])
    reject if @chatroom.nil?
    stream_from "room_channel_#{params[:chatroom_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
