require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  let(:pro_game) { FactoryBot.create(:pro_game) }
  let(:chatroom) { FactoryBot.build(:chatroom, pro_game:) }
  it '入力値が正しい場合保存できる' do
    expect(chatroom).to be_valid
  end

  it 'pro_gameが紐づけられていない場合、保存に失敗する' do
    chatroom.pro_game = nil
    chatroom.valid?
    expect(chatroom.errors[:pro_game]).to include('を入力してください')
  end
end
