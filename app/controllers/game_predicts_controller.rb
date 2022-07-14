class GamePredictsController < ApplicationController
  def index
    @today_pro_games = ProGame.where(start_at: (Time.current.beginning_of_day)..(Time.current.end_of_day))
  end

  def confilmation
  end

  def results
  end

end
