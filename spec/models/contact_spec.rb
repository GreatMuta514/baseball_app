require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) { FactoryBot.build(:contact) }
  let(:too_long_message_contact) { FactoryBot.build(:contact, :too_long_message) }
  it "入力値が正しい時、保存に成功する" do
    expect(contact).to be_valid
  end

  it "メールアドレスが未入力の場合、保存できない" do
    contact.email = nil
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end

  it "メールアドレスに@が含まれない場合保存できない" do
    contact.email = "sampleexample.com"
    contact.valid?
    expect(contact.errors[:email]).to include("は不正な値です")
  end

  it "メールアドレスに「.com」が含まれない場合保存できない" do
    contact.email = "sample@example"
    contact.valid?
    expect(contact.errors[:email]).to include("は不正な値です")
  end

  it "問い合わせ項目が選択されていない場合、保存できない" do
    contact.subject = nil
    contact.valid?
    expect(contact.errors[:subject]).to include("を入力してください")
  end

  it "問い合わせ内容が未入力の場合保存できない" do
    contact.message = nil
    contact.valid?
    expect(contact.errors[:message]).to include("を入力してください")
  end

  it "問い合わせ内容が401文字以上の場合、保存できない" do
    too_long_message_contact.valid?
    expect(too_long_message_contact.errors[:message]).to include("は400文字以内で入力してください")
  end
end
