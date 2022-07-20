class ProGamePredictCommentsController < ApplicationController
  
  def create
    @pro_game_predict_comment = current_user.pro_game_predict_comments.new(pro_game_predict_comment_params)
    if @pro_game_predict_comment.save
      # redirect_to request.referer, success: 'コメントを送信しました。'
    else
      @today_pro_game = ProGame.find(params[:pro_game_id])
      @pro_game_predict_comments = @today_pro_game.pro_game_predict_comments.order(created_at: :desc).includes(:user, :pro_game)
      render 'pro_game_predicts/new', danger: 'コメントを送信できませんでした。'
    end
  end

  def destroy
  end

  def pro_game_predict_comment_params
    params.permit(:body, :pro_game_id)
  end
end
