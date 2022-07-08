class CreateHighschoolGames < ActiveRecord::Migration[6.1]
  def change
    create_table :highschool_games do |t|
      t.string :first_side_team
      t.string :third_side_team
      t.string :first_side_team_prefecture
      t.string :third_side_team_prefecture
      t.integer :first_side_score
      t.integer :third_side_score
      t.integer :state
      t.integer :result
      t.datetime :start_at
      t.datetime :finish_at

      t.timestamps
    end
  end
end
