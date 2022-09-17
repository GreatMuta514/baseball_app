class Chatroom < ApplicationRecord
  mount_uploader :thumbnail, ChatroomThumbnailUploader

  belongs_to :pro_game
  has_many :chats, dependent: :destroy

  validates :pro_game_id, presence: true
end
