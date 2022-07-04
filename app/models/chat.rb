class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :body, presence: true

  def template
    ApplicationController.renderer.render partial: 'chatrooms/chat', locals: { chat: self }
  end

end
