class ChangeFieldColumnToNullInProGames < ActiveRecord::Migration[6.1]
  def change
    change_column_null :pro_games, :field, true
  end
end
