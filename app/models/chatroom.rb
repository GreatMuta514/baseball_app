class Chatroom < ApplicationRecord
  mount_uploader :thumbnail, ChatroomThumbnailUploader

  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
end
