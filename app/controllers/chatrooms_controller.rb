class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end
  
  def show
    @chatroom = Chatroom.find(params[:id])
    @chats = @chatroom.chats.includes(:user).all
  end
end
