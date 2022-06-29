class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :body, presence: true
end
