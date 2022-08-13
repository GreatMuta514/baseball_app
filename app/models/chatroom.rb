class Chatroom < ApplicationRecord
  mount_uploader :thumbnail, ChatroomThumbnailUploader

  belongs_to :pro_game
  has_many :chats, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
end
