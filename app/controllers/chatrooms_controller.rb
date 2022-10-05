class ChatroomsController < ApplicationController
  before_action :set_date, only: :show
  before_action :preparation_next_day, only: :show

  def show
    @chatrooms = Chatroom.where(created_at: @date.all_day).includes(:pro_game)
  end

  private

  def set_date
    @date = params[:id].to_date
  end

  def preparation_next_day
    redirect_back fallback_location: game_predict_path(Date.today), warning: '準備中です' if @date >= Date.tomorrow
  end
end
