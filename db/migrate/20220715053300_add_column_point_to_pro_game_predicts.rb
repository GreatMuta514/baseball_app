class AddColumnPointToProGamePredicts < ActiveRecord::Migration[6.1]
  def change
    add_column :pro_game_predicts, :point, :integer, min: 0, max: 100
  end
end
