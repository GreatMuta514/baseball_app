class ProGamePredict < ApplicationRecord
  belongs_to :user
  belongs_to :pro_game

  enum win_or_lose: { first_base_side_win: 0, third_base_side_win: 1, draw: 2 } 

  #予想の勝敗を判定する
  def input_win_or_lose
    if first_base_side_score > third_base_side_score
      self.win_or_lose = :first_base_side_win
    elsif first_base_side_score < third_base_side_score
      self.win_or_lose = :third_base_side_win
    elsif first_base_side_score == third_base_side_score
      self.win_or_lose = :draw
    end
  end

end
