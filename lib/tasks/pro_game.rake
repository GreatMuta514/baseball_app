# require 'open-uri'
# require 'nokogiri'

namespace :chatroom do

  desc '今日のプロ野球の試合のチャットルームを作成'
  task create: :environment do
    today_pro_games = ProGame.where(start_at: Time.current.all_day)

    today_pro_games.each do |pro_game|
      Chatroom.create!(pro_game: pro_game)
    end
  end

end

namespace :pro_game do

  desc '今日のプロ野球の試合データを取り入れる'
  task include_today_game: :environment do

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
  end


  desc '昨日のプロ野球の試合結果を取り入れる'
  task include_yesterday_result: :environment do
    
    #変数定義===================================================================================================================
    yesterday_string = Date.yesterday.to_s #リンクに当てはめるためにstring型に変換
    url = "https://baseball.yahoo.co.jp/npb/schedule/?date=#{yesterday_string}" #プロ野球機能の試合結果のhtml、readメソッドはstring型にして返す
    html = URI.open(url).read #サイトのhtmlを取得
    doc = Nokogiri::HTML.parse(html) #取得したhtmlをアプリケーションで扱える形に変換
    yesterday_games = ProGame.where(start_at: (DateTime.yesterday.beginning_of_day)..(DateTime.yesterday.end_of_day)).to_a #DBに既にある昨日の試合のデータを抽出
    yesterday_results = doc.css('.bb-score__item').to_a #サイトから昨日の試合データを抽出
    #=======================================================================================================================

    #以下は機能の試合の結果を反映===============================================================================================
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
  end


  desc '昨日のプロ野球の試合予想の結果を反映'
  task reflect_predict_result: :environment do
    @yesterday_pro_games = ProGame.where(start_at: Time.current.yesterday.all_day)

    @yesterday_pro_games.each do |yesterday_pro_game|
      #試合中止か引き分けならばスキップ
      if yesterday_pro_game.result_before_type_cast == 3 or yesterday_pro_game.result_before_type_cast == 4
        next
      end
      
      yesterday_pro_game.pro_game_predicts.each do |pro_game_predict|
      if yesterday_pro_game.first_base_side_score == pro_game_predict.first_base_side_score && yesterday_pro_game.third_base_side_score == pro_game_predict.third_base_side_score
        pro_game_predict.point = 100
      else
        pro_game_predict.point = 50  
        score_difference_01 = (yesterday_pro_game.first_base_side_score - pro_game_predict.first_base_side_score).abs
        score_difference_02 = (yesterday_pro_game.third_base_side_score - pro_game_predict.third_base_side_score).abs
        pro_game_predict.point -= (score_difference_01 + score_difference_02) * 5
        pro_game_predict.point += 40 if yesterday_pro_game.result == pro_game_predict.win_or_lose
        pro_game_predict.point = 0 if pro_game_predict.point < 0
      end

      pro_game_predict.save!
      end
    end
  end

end