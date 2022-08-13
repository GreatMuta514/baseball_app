class GamePredictsController < ApplicationController
  def index
    @today_pro_games = ProGame.where(start_at: (Time.current.beginning_of_day)..(Time.current.end_of_day))
  end

  def confilmation
  end

  def results
    @yesterday_pro_game_predicts = current_user.pro_game_predicts.where(created_at: Time.current.yesterday.all_day).includes(:pro_game)
  end

end
