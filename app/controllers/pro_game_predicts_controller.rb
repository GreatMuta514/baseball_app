class ProGamePredictsController < ApplicationController

  def new
    @today_pro_game = ProGame.find(params[:pro_game_id])
    
    @pro_game_predict_comments = @today_pro_game.pro_game_predict_comments.order(created_at: :desc).includes(:user, :pro_game)

    @current_user_predict = current_user.pro_game_predicts.find_by(pro_game_id:params[:pro_game_id])
  end

  def create
    @pro_game_predict = current_user.pro_game_predicts.new(predict_params)
    @pro_game_predict.pro_game_id = params[:pro_game_id]
    @pro_game_predict.input_win_or_lose

    if @pro_game_predict.save
      redirect_to request.referer, success: "予想を投稿しました。"
    else
      render 'pro_game_predict/new', danger: "予想の投稿に失敗しました"
    end
  end

  def edit
  end

  def update
  end

  private

  def predict_params
    params.permit(:first_base_side_score, :third_base_side_score)
  end

end
