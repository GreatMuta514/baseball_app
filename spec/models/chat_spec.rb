require 'rails_helper'

RSpec.describe Chat, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:chatroom) { FactoryBot.create(:chatroom) }
  let(:chat) { FactoryBot.build(:chat, user:, chatroom:) }

  it '入力値が正しい時、保存に成功する。' do
    expect(chat).to be_valid
  end

  it 'bodyが入力されていない時、保存に失敗する' do
    chat.body = nil
    chat.valid?
    expect(chat.errors[:body]).to include('を入力してください')
  end

  it 'bodyが101文字以上の時、保存に失敗する' do
    chat.body = SecureRandom.alphanumeric(101)
    chat.valid?
    expect(chat.errors[:body]).to include('は100文字以内で入力してください')
  end

  it 'userが紐づいていない時、保存に失敗する' do
    chat.user = nil
    chat.valid?
    expect(chat.errors[:user]).to include('を入力してください')
  end

  it 'chatroomが紐づいていない時、保存に失敗する' do
    chat.chatroom = nil
    chat.valid?
    expect(chat.errors[:chatroom]).to include('を入力してください')
  end
end
