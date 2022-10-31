class ProGame < ApplicationRecord
  has_one :chatroom, dependent: :destroy
  has_many :pro_game_predicts, dependent: :destroy
  has_many :pro_game_predict_comments, through: :pro_game_predicts

  validates :first_base_side_pro_team, presence: true
  validates :third_base_side_pro_team, presence: true
  validates :start_at, presence: true

  enum result: { before_the_start: 0, first_base_side_win: 1, third_base_side_win: 2, draw: 3, failure: 4 }
end
