FactoryBot.define do
  factory :pro_game_predict do
    first_base_side_score { 0 }
    third_base_side_score { 0 }
    win_or_lose { 2 }
    association :user
    association :pro_game

    trait :too_many_score do
      first_base_side_score { 34 }
      third_base_side_score { 34 }
    end

    trait :not_integer_score do
      first_base_side_score { SecureRandom.alphanumeric(1) }
      third_base_side_score { SecureRandom.alphanumeric(1) }
    end

    trait :decimal do
      first_base_side_score { 0.2 }
      third_base_side_score { 0.2 }
    end

    trait :negative_score do
      first_base_side_score { -1 }
      third_base_side_score { -1 }
    end
  end
end
