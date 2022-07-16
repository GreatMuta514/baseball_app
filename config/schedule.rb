set :job_template, "/bin/zsh -l -c ':job'"
job_type :rake, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"
set :output, 'log/crontab.log'
set :environment, ENV['RAILS_ENV']

every 1.day, :at => '4:30 am' do
  rake "pro_game:include_today_game"
end

every 1.day, :at => '4:40 am' do
  rake "pro_game:include_yesterday_result"
end

every 1.day, :at => '4:50 am' do
  rake "pro_game:reflect_predict_result"
end