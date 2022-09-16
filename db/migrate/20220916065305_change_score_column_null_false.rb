class ChangeScoreColumnNullFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null :pro_game_predicts, :first_base_side_score, false
    change_column_null :pro_game_predicts, :third_base_side_score, false
  end
end
