require 'rails_helper'

RSpec.describe User, type: :model do
  describe "入力が正しければ保存に成功する" do
    it "ニックネーム、メールアドレス、パスワードがあれば保存できること" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end

  describe "メールアドレス" do
    it "メールアドレスが未入力だと保存できない" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "メールアドレスが重複している場合保存できない" do
      user = FactoryBot.create(:user)
      duplicate_email_user = FactoryBot.build(:user)
      duplicate_email_user.valid?
      expect(duplicate_email_user.errors[:email]).to include("はすでに存在します")
    end

    it "メールアドレスに@が含まれない場合保存できない" do
      user = FactoryBot.build(:user, email: "sampleexample.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "@から始まるメールアドレスは保存できない" do
      user = FactoryBot.build(:user, email: "@example.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "「.com」が含まれないメールアドレスは保存できない" do
      user = FactoryBot.build(:user, email: "sample@example")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
  end

  describe "ニックネーム" do
    it "ニックネームが未入力なら保存できない" do
      user = FactoryBot.build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "ニックネームが17文字以上なら保存できない" do
      user = FactoryBot.build(:user, nickname: "あいうえおかきくけこさしすせそたち")
      user.valid?
      expect(user.errors[:nickname]).to include("は16文字以内で入力してください")
    end
  end

  describe "パスワード" do
    it "パスワードが8文字以下なら保存できない" do
      user = FactoryBot.build(:user, :too_little_password)
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end

    it "パスワードが21文字以上なら保存できない" do
      user = FactoryBot.build(:user, :too_many_password)
      user.valid?
      expect(user.errors[:password]).to include("は20文字以内で入力してください")
    end
  end
end
