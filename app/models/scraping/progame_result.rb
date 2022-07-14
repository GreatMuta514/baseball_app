require 'open-uri'
require 'nokogiri'
require 'date'
require 'pry'

#変数定義 =================================================================================================================
yesterday_string = Date.yesterday.to_s #リンクに当てはめるためにstring型に変換
url = "https://baseball.yahoo.co.jp/npb/schedule/?date=#{yesterday_string}" #プロ野球機能の試合結果のhtml、readメソッドはstring型にして返す
html = URI.open(url).read #サイトのhtmlを取得
doc = Nokogiri::HTML.parse(html) #取得したhtmlをアプリケーションで扱える形に変換
yesterday_games = ProGame.where(start_at: (DateTime.yesterday.beginning_of_day)..(DateTime.yesterday.end_of_day)).to_a #DBに既にある昨日の試合のデータを抽出
yesterday_results = doc.css('.bb-score__item').to_a #サイトから昨日の試合データを抽出
===========================================================================================================================


#以下は機能の試合の結果を反映 =============================================================================================
yesterday_games.zip(yesterday_results) do |yesterday_game, yesterday_result|

  #試合成立ならば 
  if yesterday_result.css('.bb-score__link').text == "試合終了"
    #スコアを代入
    first_base_side_score = yesterday_result.css('.bb-score__score--left').text.to_i
    third_base_side_score = yesterday_result.css('.bb-score__score--right').text.to_i
    yesterday_game.first_base_side_score = first_base_side_score
    yesterday_game.third_base_side_score = third_base_side_score

    #一塁側と三塁側のスコアを比較し、試合結果を代入
    if yesterday_game.first_base_side_score > yesterday_game.third_base_side_score
      yesterday_game.result = :first_base_side_win
    elsif yesterday_game.first_base_side_score < yesterday_game.third_base_side_score
      yesterday_game.result = :third_base_side_win
    elsif yesterday_game.first_base_side_score == yesterday_game.third_base_side_score
      yesterday_game.result = :draw
    end

  #試合不成立ならば
  else
    #failureを代入
    yesterday_game.result = :failure
  end
  #変更を保存
  yesterday_game.save!
end
============================================================================================================================