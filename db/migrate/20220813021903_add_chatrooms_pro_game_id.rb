class AddChatroomsProGameId < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :pro_game, foreign_key: true
  end
end
