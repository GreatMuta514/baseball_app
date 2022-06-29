class ChatsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.chatroom_id = params[:chatroom_id]
    if @chat.save
      redirect_to chatroom_path(params[:chatroom_id]), success: "チャットを送信しました"
    else
      redirect_to chatroom_path(params[:chatroom_id]), danger: "チャットを送信できませんでした"
    end
  end

  def destroy
  end

  private

  def chat_params
    params.permit(:body, :chatroom_id)
  end

end
