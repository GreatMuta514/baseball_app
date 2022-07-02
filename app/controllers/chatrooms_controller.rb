class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end
  
  def show
    @chatroom = Chatroom.find(params[:id])
    @chats = Chat.where(chatroom: @chatroom).includes(:user)

    # @mychats = @chats.where(user: current_user).includes(:user)
    # @otherchats = @chats.where.not(user: current_user).includes(:user)
    # @chats = @mychats.or(@otherchats).order(:created_at)
  end
end
