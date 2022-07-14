class CreateProGames < ActiveRecord::Migration[6.1]
  def change
    create_table :pro_games do |t|
      t.string :field, null: false
      t.string :first_base_side_pro_team, null: false
      t.string :third_base_side_pro_team, null: false
      t.integer :first_base_side_score
      t.integer :third_base_side_score
      t.string :first_base_side_pitcher
      t.string :third_base_side_pitcher
      t.integer :result
      t.integer :state
      t.datetime :start_at, null: false
      t.datetime :finish_at

      t.timestamps
    end
  end
end
