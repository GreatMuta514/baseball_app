class ProGamePredictCommentsController < ApplicationController
  before_action :require_login

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
end
