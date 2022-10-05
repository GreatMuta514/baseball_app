class AddCommentsPredictId < ActiveRecord::Migration[6.1]
  def change
    add_reference :pro_game_predict_comments, :pro_game_predict, foreign_key: true
  end
end
