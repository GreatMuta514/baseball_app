require 'rails_helper'

RSpec.describe "Users", type: :system do
  context "未ログイン時" do
    describe "新規ユーザー登録" do
      it "正しい入力値ならばユーザー登録に成功する" do
        visit root_path
        expect {
          click_button "ユーザー登録"
          fill_in "ニックネーム", with: "サンプルユーザー"
          fill_in "メールアドレス", with: "sample1@example.com"
          fill_in "パスワード", with: "password"
          fill_in "パスワード確認", with: "password"
          click_button "登録する"
          expect(page).to have_content(I18n.t("users.create.success"))
          expect(page).to have_content "ニックネーム: サンプルユーザー"
        }.to change(User.all, :count).by(1)
      end

      it "不正な入力値ならばユーザー登録に失敗する" do
        visit root_path
        expect {
          click_button "ユーザー登録"
          fill_in "ニックネーム", with: ""
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: ""
          fill_in "パスワード確認", with: ""
          click_button "登録する"
        }.to change(User.all, :count).by(0)
        expect(current_path).to eq(users_path)
      end
    end
  end

  context "ログイン時" do
    let(:user) { FactoryBot.create(:user) }
    let(:another_user) { FactoryBot.create(:user, :another) }
    before do
      login(user)
    end

    describe "ユーザー詳細" do
      it "自分のプロフィールの場合編集リンクが存在する" do
        visit user_path(user)
        expect(page).to have_content(I18n.t("users.show.edit"))
      end

      it "他人のプロフィール詳細画面で編集リンクが存在しない" do
        visit user_path(another_user)
        expect(page).not_to have_css("edit-link-#{another_user.id}")
      end
    end

    describe "ユーザー編集・更新" do
      it "自分のプロフィールの場合、編集・更新できる" do
        visit edit_user_path(user)
        fill_in 'ニックネーム', with: "New Nickname"
        fill_in "メールアドレス", with: "new@example.com"
        click_button "更新する"
        expect(page).to have_content "プロフィールの更新が完了しました"
        expect(user.reload.nickname).to eq "New Nickname"
        expect(user.email).to eq "new@example.com"
      end

      it "他人のプロフィールの場合、編集・更新できない" do
        visit edit_user_path(another_user)
        expect(current_path).to eq(chatrooms_path)
        expect(page).to have_content("他のユーザーです")
      end
    end
    
    # describe "ユーザー削除" do
    #   it "" do

    #   end
    # end
  end
end
