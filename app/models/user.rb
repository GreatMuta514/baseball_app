class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :profile, ProfileUploader

  has_many :chats, dependent: :destroy
  has_many :pro_game_predicts, dependent: :destroy
  has_many :pro_game_predict_comments, dependent: :destroy

  validates :nickname, presence: true, length: { maximum: 16 }, invalid_words: true
  validates :password, length: { minimum: 8, maximum: 20 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :reset_password_token, uniqueness: true, allow_nil: true
  validates :role, presence: true

  enum role: { general: 0, admin: 1, guest: 2 }

end
