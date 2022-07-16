class RemoveColumnFromProGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :pro_games, :state
    remove_column :pro_games, :how_to_win
    remove_column :pro_games, :flow_of_game
  end
end
