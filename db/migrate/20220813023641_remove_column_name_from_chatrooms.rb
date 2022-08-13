class RemoveColumnNameFromChatrooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :chatrooms, :title
  end
end
