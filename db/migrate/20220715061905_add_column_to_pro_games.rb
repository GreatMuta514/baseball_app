class AddColumnToProGames < ActiveRecord::Migration[6.1]
  def change
    add_column :pro_games, :how_to_win, :integer
    add_column :pro_games, :flow_of_game, :integer
  end
end
