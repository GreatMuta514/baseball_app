require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "未ログイン時" do
    # 新規ユーザー登録
    it "ユーザー登録ができる" do
      visit root_path

      expect {
        click_button "ユーザー登録"
        fill_in "ニックネーム", with: "サンプルユーザー"
        fill_in "メールアドレス", with: "sample@example.com"
        fill_in "パスワード", with: "password"
        fill_in "パスワード確認", with: "password"
        click_button "登録する"
        expect(page).to have_content "User was successfully created."
        expect(page).to have_content "ニックネーム: サンプルユーザー"
      }.to change(User.all, :count).by(1)
    end
  end

  describe "ログイン時" do
    let(:user) { FactoryBot.create(:user) }
  end
end
