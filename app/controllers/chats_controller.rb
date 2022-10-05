class ChatsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.chatroom_id = params[:chatroom_id]
    @chat.save!
    RoomChannel.broadcast_to("room_channel_#{@chat.chatroom_id}", chat: @chat.template)
  end

  def destroy; end

  private

  def chat_params
    params.permit(:body, :chatroom_id)
  end
end
