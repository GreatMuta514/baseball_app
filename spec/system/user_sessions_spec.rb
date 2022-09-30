require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  describe 'ログイン処理' do
    let(:user) { FactoryBot.create(:user) }
    it 'メールアドレスとパスワードが正しい時、ログインできる' do
      visit login_path
      fill_in 'email', with: user.email
      fill_in 'password', with: 'password'
      click_button 'ログイン'
      expect(current_path).to eq chatrooms_path
      expect(page).to have_content('ログインしました')
    end

    it 'メールアドレスまたはパスワードが間違っている時、ログインできない' do
      visit login_path
      fill_in 'email', with: user.email
      fill_in 'password', with: 'incorrect'
      click_button 'ログイン'
      expect(current_path).to eq login_path
      expect(page).to have_content('メールアドレスまたはパスワードが間違っています')
    end
  end

  describe 'パスワードリセット' do
    it '存在するメールアドレスを入力した時、パスワードリセットメールを受け取れる' do
    end
    it '存在しないパスワードを入力した時、パスワードリセットメールを受け取れない' do
    end
  end
end
