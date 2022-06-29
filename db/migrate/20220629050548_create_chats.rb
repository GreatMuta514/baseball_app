class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.string :body, null: false, limit: 100
      t.references :user, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
