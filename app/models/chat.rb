class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :body, presence: true, length: { maximum: 100 }, invalid_words: true

  def template
    ApplicationController.renderer.render partial: 'chats/chat', locals: { chat: self }
  end
end
