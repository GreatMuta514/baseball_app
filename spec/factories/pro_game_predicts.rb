FactoryBot.define do
  factory :pro_game_predict do
    first_base_side_score { 0 }
    third_base_side_score { 0 }
    win_or_lose { 2 }
    association :user
    association :pro_game
  end
end
