class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(created_at: Time.current.all_day).includes(:pro_game)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chats = Chat.where(chatroom: @chatroom).includes(:user)
    @submitting_chat = Chat.new
  end
end
