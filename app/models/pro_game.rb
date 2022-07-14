class ProGame < ApplicationRecord

  has_many :pro_game_predicts

  enum result: { before_the_start: 0, first_base_side_win: 1, third_base_side_win: 2, draw: 3, failure: 4 }
  
  
end
