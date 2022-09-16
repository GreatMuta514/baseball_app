class ChangeProGameIdColumnToNullFalseInProGamePredicts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :pro_game_predicts, :pro_game_id, false
  end
end
