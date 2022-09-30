FactoryBot.define do
  factory :pro_game do
    first_base_side_pro_team { '巨人' }
    third_base_side_pro_team { '阪神' }
    start_at { Time.current.beginning_of_day.since(18.hours) }

    trait :another do
      first_base_side_pro_team { 'オリックス' }
      third_base_side_pro_team { 'ロッテ' }
    end
  end
end
