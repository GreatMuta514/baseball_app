require 'rails_helper'

RSpec.describe ProGamePredictComment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:pro_game) { FactoryBot.create(:pro_game) }
  let(:pro_game_predict_comment) { FactoryBot.build(:pro_game_predict_comment, user:, pro_game:) }
  it '正しい入力値の時に保存できる' do
    expect(pro_game_predict_comment).to be_valid
  end

  it 'コメントが未入力の時に保存が失敗する' do
    pro_game_predict_comment.body = nil
    pro_game_predict_comment.valid?
    expect(pro_game_predict_comment.errors[:body]).to include('を入力してください')
  end

  it 'コメントの文字数が141時以上の時に保存が失敗する' do
    pro_game_predict_comment.body = SecureRandom.alphanumeric(141)
    pro_game_predict_comment.valid?
    expect(pro_game_predict_comment.errors[:body]).to include('は140文字以内で入力してください')
  end

  it 'userが紐づいていない時に保存が失敗する' do
    pro_game_predict_comment.user = nil
    pro_game_predict_comment.valid?
    expect(pro_game_predict_comment.errors[:user]).to include('を入力してください')
  end

  it 'pro_gameが紐づいていない時に保存が失敗する' do
    pro_game_predict_comment.pro_game = nil
    pro_game_predict_comment.valid?
    expect(pro_game_predict_comment.errors[:pro_game]).to include('を入力してください')
  end
end
