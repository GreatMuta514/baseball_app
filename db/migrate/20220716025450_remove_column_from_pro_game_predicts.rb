class RemoveColumnFromProGamePredicts < ActiveRecord::Migration[6.1]
  def change
    remove_column :pro_game_predicts, :how_to_win
    remove_column :pro_game_predicts, :flow_of_game
  end
end
