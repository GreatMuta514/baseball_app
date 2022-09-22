module LoginSupport
  def login(user)
    visit root_path
    click_button "ログイン"
    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_button "ログイン"
    expect(page).to have_content(I18n.t("user_sessions.create.success"))
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end