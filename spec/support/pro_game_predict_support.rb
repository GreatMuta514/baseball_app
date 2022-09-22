module ProGamePredictSupport
  def create_game_predict
    fill_in 'first_base_side_score', with: 0
    fill_in 'third_base_side_score', with: 0
    click_button "投票する"
    page.accept_confirm
    sleep 1
  end
end

RSpec.configure do |config|
  config.include ProGamePredictSupport
end