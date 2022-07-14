class AddColumnToProGamePredicts < ActiveRecord::Migration[6.1]
  def change
    add_reference :pro_game_predicts, :pro_game, foreign_key: true
  end
end
