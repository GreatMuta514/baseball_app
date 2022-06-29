class CreateChatrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chatrooms do |t|
      t.string :name, null: false, unique: true, limit: 30
      t.string :thumbnail

      t.timestamps
    end
  end
end
