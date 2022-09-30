class ChatroomsController < ApplicationController
  before_action :require_login, only: :show
  def index
    @chatrooms = Chatroom.where(created_at: Time.current.all_day).includes(:pro_game)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @user = current_user
    @chats = Chat.where(chatroom: @chatroom).includes(:user)
    @submitting_chat = Chat.new
  end
end
