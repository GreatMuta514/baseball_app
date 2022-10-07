class ProGamePredictsController < ApplicationController
  before_action :require_login, only: :create
  before_action :reject_guest, only: :create
  before_action :set_today_pro_game, only: %i[new create]
  before_action :time_check, only: :create

  def new
    @pro_game_predict_comments = @today_pro_game.pro_game_predict_comments.order(created_at: :desc).includes(:user, :pro_game, :pro_game_predict)
    @current_user_predict = current_user.pro_game_predicts.find_by(pro_game_id: params[:pro_game_id]) if current_user
  end

  def create
    @pro_game_predict = current_user.pro_game_predicts.new(predict_params)
    @pro_game_predict.input_win_or_lose
    if @pro_game_predict.save
      redirect_to request.referer, success: t('.success')
    else
      render 'pro_game_predicts/new'
      flash.now[:danger] = t('.danger')
    end
  end

  def edit; end

  def update; end

  private

  def predict_params
    params.permit(:first_base_side_score, :third_base_side_score, :pro_game_id)
  end

  def set_today_pro_game
    @today_pro_game = ProGame.find(params[:pro_game_id])
  end

  def time_check
    if @today_pro_game.start_at < Time.current
      flash.now[:danger] = "試合開始予定時間を過ぎているため投稿できません"
      render 'pro_game_predicts/new'
      return false
    end
  end
end
