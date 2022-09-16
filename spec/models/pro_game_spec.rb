require 'rails_helper'

RSpec.describe ProGame, type: :model do
  it "正しい入力値の場合正常に保存ができる" do
    pro_game = FactoryBot.build(:pro_game)
    expect(pro_game).to be_valid
  end

  describe "バリデーションチェック" do
    it "一塁側のチームが存在しない場合保存できない" do
      pro_game = FactoryBot.build(:pro_game, first_base_side_pro_team: nil)
      pro_game.valid?
      expect(pro_game.errors[:first_base_side_pro_team]).to include("を入力してください")
    end

    it "三塁側のチームが存在しない場合保存できない" do
      pro_game = FactoryBot.build(:pro_game, third_base_side_pro_team: nil)
      pro_game.valid?
      expect(pro_game.errors[:third_base_side_pro_team]).to include("を入力してください")
    end

    it "開始時刻が未入力の場合保存できない" do
      pro_game = FactoryBot.build(:pro_game, start_at: nil)
      pro_game.valid?
      expect(pro_game.errors[:start_at]).to include("を入力してください")
    end
  end
end
