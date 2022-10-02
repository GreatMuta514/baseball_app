crumb :chatrooms do
  link '今日の試合', chatrooms_path
end

crumb :chatroom do |chatroom|
  link "#{chatroom.pro_game.first_base_side_pro_team}-#{chatroom.pro_game.third_base_side_pro_team}", chatroom_path(chatroom)
  parent :chatrooms
end

crumb :pro_game_predicts do
  link '今日の予想', game_predict_path(Date.today)
end

crumb :pro_game_predict do |pro_game|
  link "#{pro_game.first_base_side_pro_team}-#{pro_game.third_base_side_pro_team}の試合予想", new_pro_game_pro_game_predict_path(pro_game)
  parent :pro_game_predicts
end

crumb :user do |user|
  link "#{user.nickname}さんのプロフィール", user_path(user)
end

crumb :edit_user do |user|
  link 'プロフィール編集', edit_user_path(user)
  parent :user, user
end
