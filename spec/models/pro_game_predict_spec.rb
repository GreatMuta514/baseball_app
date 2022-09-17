require 'rails_helper'

RSpec.describe ProGamePredict, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:pro_game) { FactoryBot.create(:pro_game) }
  let(:pro_game_predict) { FactoryBot.build(:pro_game_predict, user: user, pro_game: pro_game) }

  describe "正常時" do
    it "入力値が正しい時保存に成功する" do
      expect(pro_game_predict).to be_valid
    end
  end
  
  describe "未入力時のバリデーションチェック" do
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

  describe "スコアのバリデーションチェック" do
    let(:too_many_score_predict) { FactoryBot.build(:pro_game_predict, :too_many_score, user: user, pro_game: pro_game) }
    let(:not_integer_score_predict) { FactoryBot.build(:pro_game_predict, :not_integer_score, user: user, pro_game: pro_game) }
    let(:decimal_score_predict) { FactoryBot.build(:pro_game_predict, :decimal, user: user, pro_game: pro_game) }
    let(:negative_score_predict) { FactoryBot.build(:pro_game_predict, :negative_score, user: user, pro_game: pro_game) }
    it "34点以上のスコアは保存できない" do
      too_many_score_predict.valid?
      expect(too_many_score_predict.errors[:first_base_side_score]).to include("は33以下の値にしてください")
      expect(too_many_score_predict.errors[:third_base_side_score]).to include("は33以下の値にしてください")
    end

    it "少数は保存できない" do
      decimal_score_predict.valid?
      expect(decimal_score_predict.errors[:first_base_side_score]).to include("は整数で入力してください")
      expect(decimal_score_predict.errors[:third_base_side_score]).to include("は整数で入力してください")
    end

    it "負の数は保存できない" do
      negative_score_predict.valid?
      expect(negative_score_predict.errors[:first_base_side_score]).to include("は0以上の値にしてください", "は不正な値です")
      expect(negative_score_predict.errors[:third_base_side_score]).to include("は0以上の値にしてください", "は不正な値です")
    end

    it "数値でないものは保存できない" do
      not_integer_score_predict.valid?
      expect(not_integer_score_predict.errors[:first_base_side_score]).to include("は数値で入力してください")
      expect(not_integer_score_predict.errors[:third_base_side_score]).to include("は数値で入力してください")
    end
  end
  
end
