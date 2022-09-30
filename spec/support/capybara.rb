RSpec.configure do |config|
  # 基本的にrack_testを使うことで目視をしない
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  # JavaScriptドライバとしてseleniumを使う
  config.before(:each, type: :system, js: true) do
    # jsテスト時にchromeで目視で確認するには
    # driven_by :selenium_chrome
    # chromeで目視で確認したくないときは
    driven_by :selenium_chrome_headless
  end

  # テスト実行時にbundle exec rake assets:precompileを実行する
  # config.before :suite do
  #   %x[bundle exec rake assets:precompile]
  # end

  # capybaraの待ち時間を15秒に
  Capybara.default_max_wait_time = 3
end
