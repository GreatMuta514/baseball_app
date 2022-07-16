class RenameResultColumnToProGamePredicts < ActiveRecord::Migration[6.1]
  def change
    rename_column :pro_game_predicts, :result, :win_or_lose
  end
end
