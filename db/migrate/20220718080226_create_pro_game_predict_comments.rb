class CreateProGamePredictComments < ActiveRecord::Migration[6.1]
  def change
    create_table :pro_game_predict_comments do |t|
      t.string :body, null: false, limit: 140
      t.references :user, null: false, foreign_key: true
      t.references :pro_game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
