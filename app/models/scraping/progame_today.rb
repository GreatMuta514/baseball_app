require 'open-uri'
require 'nokogiri'
require 'date'

#変数定義
today_string = Date.today.to_s
url = "https://baseball.yahoo.co.jp/npb/schedule/?date=#{today_string}"

#プロ野球機能の試合結果のhtml、readメソッドはstring型にして返す
html = URI.open(url).read
doc = Nokogiri::HTML.parse(html)
games = doc.css('.bb-score__item').to_a

#今日の各試合のデータをDBに保存
games.each do |game|
  pro_game = ProGame.new(
    field: game.css('.bb-score__venue').text,
    first_base_side_pro_team: game.css('.bb-score__team .bb-score__homeLogo').text,
    third_base_side_pro_team: game.css('.bb-score__team .bb-score__awayLogo').text,
    start_at: game.css('.bb-score__status').text.to_time,
    first_base_side_pitcher: game.css('.bb-score__home .bb-score__player--probable').text,
    third_base_side_pitcher: game.css('.bb-score__away .bb-score__player--probable').text
  )
  pro_game.save if pro_game.valid?
end
