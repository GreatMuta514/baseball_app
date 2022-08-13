class ChangeColumnProGameIdOfChatroomsNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :chatrooms, :pro_game_id, false
  end
end
