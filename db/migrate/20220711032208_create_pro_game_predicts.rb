class CreateProGamePredicts < ActiveRecord::Migration[6.1]
  def change
    create_table :pro_game_predicts do |t|
      t.integer :first_base_side_score
      t.integer :third_base_side_score
      t.references :user, null: false, foreign_key: true
      t.integer :result
      t.integer :how_to_win
      t.integer :flow_of_game

      t.timestamps
    end
  end
end
