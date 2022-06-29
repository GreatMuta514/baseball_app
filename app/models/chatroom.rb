class Chatroom < ApplicationRecord
  mount_uploader :thumbnail, ChatroomThumbnailUploader

  has_many :chats

  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
end
