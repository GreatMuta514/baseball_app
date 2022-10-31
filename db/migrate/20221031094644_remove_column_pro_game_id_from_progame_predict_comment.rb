class RemoveColumnProGameIdFromProgamePredictComment < ActiveRecord::Migration[6.1]
  def change
    remove_column :pro_game_predict_comments, :pro_game_id
  end
end
