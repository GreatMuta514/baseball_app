class ProGamePredictComment < ApplicationRecord
  belongs_to :user
  belongs_to :pro_game

  validates :body, presence: true, length: { maximum: 140 }, invalid_words: true
  validates :user_id, presence: true
  validates :pro_game_id, presence: true
end
