require 'rails_helper'

RSpec.describe ProGamePredict, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:pro_game) { FactoryBot.create(:pro_game) }
  let(:pro_game_predict) { FactoryBot.build(:pro_game_predict, user: user, pro_game: pro_game) }
  it "入力値が正しい時保存に成功する" do
    expect(pro_game_predict).to be_valid
  end

  it "pro_game_idがnullの時保存に失敗する" do
    pro_game_predict.pro_game_id = nil
    pro_game_predict.valid?
    expect(pro_game_predict.errors[:pro_game_id]).to include("を入力してください")
  end

  it "user_idがnullの時保存に失敗する" do
    pro_game_predict.user_id = nil
    pro_game_predict.valid?
    expect(pro_game_predict.errors[:user]).to include("を入力してください")
  end

  it "一塁側のスコアが入力されていない時保存に失敗する" do
    pro_game_predict.first_base_side_score = nil
    pro_game_predict.valid?
    expect(pro_game_predict.errors[:first_base_side_score]).to include("を入力してください")
  end

  it "三塁側のスコアが入力されていない時保存に失敗する" do
    pro_game_predict.third_base_side_score = nil
    pro_game_predict.valid?
    expect(pro_game_predict.errors[:third_base_side_score]).to include("を入力してください")
  end

  it "勝敗予想が未入力の時保存に失敗する" do
    pro_game_predict.win_or_lose = nil
    pro_game_predict.valid?
    expect(pro_game_predict.errors[:win_or_lose]).to include("を入力してください")
  end
end
