class ProGamePredictComment < ApplicationRecord
  belongs_to :user
  belongs_to :pro_game

  validates :body, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :pro_game_id, presence: true
end
