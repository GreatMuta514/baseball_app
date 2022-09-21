FactoryBot.define do
  factory :chatroom do
    association :pro_game

    trait :another do
      association :pro_game, :another
    end
  end
end
