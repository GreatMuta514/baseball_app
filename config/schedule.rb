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

every 1.day, at: '12:30' do
  rake 'pro_game:include_today_game', environment: ENV['RAILS_ENV']
end

every 1.day, at: '12:32' do
  rake 'chatroom:create', environment: ENV['RAILS_ENV']
end

every 1.day, at: '12:34' do
  rake 'pro_game:include_yesterday_result', environment: ENV['RAILS_ENV']
end

every 1.day, at: '12:36' do
  rake 'pro_game:reflect_predict_result', environment: ENV['RAILS_ENV']
end
