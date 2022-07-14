class ProGamePredict < ApplicationRecord
  belongs_to :user
  belongs_to :pro_game

  enum result: { first_base_side_win: 0, third_base_side_win: 1, draw: 2 } 
  enum how_to_win: { close_battle: 0, good_victory: 1, big_win: 2 }

  #予想の勝敗を判定する
  def input_win_or_lose
    if first_base_side_score > third_base_side_score
      self.result = :first_base_side_win
    elsif first_base_side_score < third_base_side_score
      self.result = :third_base_side_win
    elsif first_base_side_score == third_base_side_score
      self.result = :draw
    end
  end

  #辛勝・快勝・大勝を判断
  def input_how_to_win
    if (first_base_side_score - third_base_side_score).abs <= 3
      self.how_to_win = :close_battle
    elsif (first_base_side_score - third_base_side_score).abs >= 4 && (first_base_side_score - third_base_side_score).abs <= 6
      self.how_to_win = :good_victory
    else
      self.how_to_win = :big_win
    end
  end

end
