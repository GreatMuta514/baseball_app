class ProGamePredictCommentsController < ApplicationController
  before_action :require_login
  before_action :set_current_user_predict, only: :create
  before_action :require_predict, only: :create

  def create
    @pro_game_predict_comment = current_user.pro_game_predict_comments.new(pro_game_predict_comment_params)
    @today_pro_game = ProGame.find(params[:pro_game_id])
    unless @pro_game_predict_comment.save
      @pro_game_predict_comments = @today_pro_game.pro_game_predict_comments.order(created_at: :desc).includes(:user, :pro_game)
      render 'pro_game_predicts/new', danger: t('.danger')
    end
  end

  def destroy; end

  private

  def pro_game_predict_comment_params
    params.permit(:body, :pro_game_id)
  end

  def set_current_user_predict
    @current_user_predict = ProGamePredict.find_by(user: current_user, pro_game: params[:pro_game_id])
  end

  def require_predict
    redirect_to request.referer, danger: t('pro_game_predict_comments.require_predict.danger') unless @current_user_predict
  end
end
