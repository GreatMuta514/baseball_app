require 'rails_helper'

RSpec.describe "ProGamePredicts", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:pro_game) { FactoryBot.create(:pro_game) }
  before do
    login(user)
    @pro_game = FactoryBot.create(:pro_game)
  end

  describe "予想機能",js: true do
    it "正常な入力値の時、予想が保存され、コメント送信フォームとコメントが表示される" do
      another_user_comment = FactoryBot.create(:pro_game_predict_comment, :another_user, pro_game: @pro_game)
      visit game_predicts_path
      click_link "today_pro_game_predict_button_#{@pro_game.id}"
      expect(current_path).to eq new_pro_game_pro_game_predict_path(@pro_game)
      expect{
        create_game_predict
      }.to change(ProGamePredict.all, :count).by(1)

      expect(page).not_to have_content("予想を投稿すれば表示されます")
      expect(page).to have_selector("#pro_game_predict_comment_form_#{@pro_game.id}")
      expect(page).to have_content("#{another_user_comment.body}")
    end

    it "不正な入力値の時、予想が保存されず、コメント送信フォームが表示されていない" do
      visit game_predicts_path
      click_link "today_pro_game_predict_button_#{@pro_game.id}"
      expect(current_path).to eq new_pro_game_pro_game_predict_path(@pro_game)
      expect{
        fill_in 'first_base_side_score', with: "０"
        fill_in 'third_base_side_score', with: "０"
        click_button "投票する"
        expect(page.accept_confirm).to have_content("半角数字で入力してください")
        sleep 1
      }.to change(ProGamePredict.all, :count).by(0)
    end

    it "ユーザーは同じ試合の予想を2つ以上投稿できない" do
      visit game_predicts_path
      click_link "today_pro_game_predict_button_#{@pro_game.id}"
      expect(current_path).to eq new_pro_game_pro_game_predict_path(@pro_game)
      expect{
        create_game_predict
      }.to change(ProGamePredict.all, :count).by(1)
      expect(current_path).to eq new_pro_game_pro_game_predict_path(@pro_game)
      expect(page).to have_content("投票済み")
    end
  end

  describe "予想コメント機能",js: true do
    it "入力値が正しい時、コメントを送信できる" do
      visit game_predicts_path
      click_link "today_pro_game_predict_button_#{@pro_game.id}"
      expect(current_path).to eq new_pro_game_pro_game_predict_path(@pro_game)
      create_game_predict
      expect{
        fill_in "body", with: "予想楽しい"

        click_button "送信する"
        sleep 1
      }.to change(ProGamePredictComment.all, :count).by(1)
      expect(page).to have_content("予想楽しい")
    end
  end

  describe "予想結果" do

  end
end
