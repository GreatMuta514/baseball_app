class AddColumnToProGamePredictComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :pro_game_predict_comments, :parent, foreign_key: {to_table: :pro_game_predict_comments}
  end
end
