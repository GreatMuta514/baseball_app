class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nickname, :string, null: false, limit: 16, unique: true
    add_column :users, :profile, :string
    add_column :users, :rank, :integer, null: false, default: 0
  end
end
