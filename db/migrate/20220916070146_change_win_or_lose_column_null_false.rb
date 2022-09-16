class ChangeWinOrLoseColumnNullFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null :pro_game_predicts, :win_or_lose, false
  end
end
