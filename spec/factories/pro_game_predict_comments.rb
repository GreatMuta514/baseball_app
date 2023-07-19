FactoryBot.define do
  factory :pro_game_predict_comment do
    body { '33-4でロッテが阪神に勝つと予想。' }
    association :user
    association :pro_game
    association :pro_game_predict

    trait :another_user do
      association :user, :another
      association :pro_game_predict, :another_user
    end
  end
end
