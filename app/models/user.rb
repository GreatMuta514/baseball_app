class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :profile, ProfileUploader

  has_many :chats, dependent: :destroy
  has_many :pro_game_predicts, dependent: :destroy
  
  # バリデーション
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true

  validates :reset_password_token, uniqueness: true, allow_nil: true

end
