# setは変数の設定
# eval次のコマンドを打ってね

# ログの吐き出し場所を設定
set :output, 'log/crontab.log'
# cronを実行する環境をrailsに設定
set :environment, ENV['RAILS_ENV']
# パスを設定している
env :PATH, ENV['PATH']

# 記事から持ってきた
set :job_template, "/bin/zsh -l -c ':job'"
job_type :rake, 'eval "$(rbenv init -)"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output'

every 1.day, at: '0:30 pm' do
  rake 'pro_game:include_today_game', environment: ENV['RAILS_ENV']
end

every 1.day, at: '0:32 pm' do
  rake 'chatroom:create', environment: ENV['RAILS_ENV']
end

every 1.day, at: '0:34 pm' do
  rake 'pro_game:include_yesterday_result', environment: ENV['RAILS_ENV']
end

every 1.day, at: '0:36 pm' do
  rake 'pro_game:reflect_predict_result', environment: ENV['RAILS_ENV']
end
