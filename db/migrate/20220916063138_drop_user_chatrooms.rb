class DropUserChatrooms < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_chatrooms
  end
end
