require 'rails_helper'

RSpec.describe 'Chats', type: :system do
  context 'ログイン時', js: true do
    let(:user) { FactoryBot.create(:user) }
    let(:another_user) { FactoryBot.create(:user, :another) }
    let(:another_chatroom) { FactoryBot.create(:chatroom, :another) }
    before do
      login(user)
      @chatroom = FactoryBot.create(:chatroom)
    end
    it 'ユーザーはチャットを送信できる' do
      chat_body = SecureRandom.alphanumeric(100)
      visit chatrooms_path
      click_link "entrance-chatroom-#{@chatroom.id}"
      expect(current_path).to eq chatroom_path(@chatroom)
      expect do
        fill_in 'body', with: chat_body
        click_button '送信'
        expect(page).to have_content(chat_body)
      end.to change(Chat.all, :count).by(1)
    end

    it 'チャット未入力時、送信ボタンを無効化' do
      visit chatrooms_path
      click_link "entrance-chatroom-#{@chatroom.id}"
      expect(current_path).to eq chatroom_path(@chatroom)
      expect(find('#chat_submit_button')).to have_css('.disabled')
    end

    it 'チャットが100文字を超えている時、送信ボタンを無効化し、フラッシュメッセージを表示' do
      chat_body = SecureRandom.alphanumeric(101)
      visit chatrooms_path
      click_link "entrance-chatroom-#{@chatroom.id}"
      expect(current_path).to eq chatroom_path(@chatroom)
      fill_in 'body', with: chat_body
      expect(find('#chat_submit_button')).to have_css('.disabled')
      # フラッシュメッセージが表示されているか
    end

    it '同じルームの他ユーザーのチャットが表示されていること' do
      visit chatrooms_path
      click_link "entrance-chatroom-#{@chatroom.id}"
      expect(current_path).to eq chatroom_path(@chatroom)
      another_user_chat = Chat.create!(body: '野球面白い', user: another_user, chatroom: @chatroom)
      sleep 1
      expect(page).to have_content('野球面白い')
    end

    it '別のルームの他ユーザーのチャットが表示されていないこと' do
      visit chatrooms_path
      click_link "entrance-chatroom-#{@chatroom.id}"
      expect(current_path).to eq chatroom_path(@chatroom)
      another_chatroom_chat = Chat.create!(body: '野球面白い', user: another_user, chatroom: another_chatroom)
      sleep 1
      expect(page).not_to have_content('野球面白い')
    end
  end
end
