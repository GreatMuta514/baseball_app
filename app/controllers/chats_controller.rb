class ChatsController < ApplicationController
  before_action :require_login, only: %i[create destroy]
  before_action :reject_guest_chat_create, only: :create

  def index
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chats = Chat.where(chatroom: @chatroom).includes(:user)
    @submitting_chat = Chat.new
  end
  
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

  def reject_guest_chat_create
    redirect_back fallback_location: root_path, danger: "ゲストは利用できません、会員登録かログインしてください" if current_user.guest?
  end

end
