FactoryBot.define do
  factory :user do
    nickname { 'Sample' }
    sequence(:email) { |n| "sample#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }

    trait :too_little_password do
      password { '1234567' }
      password_confirmation { '1234567' }
    end

    trait :too_many_password do
      password { 123_456_789_012_345_678_901 }
      password_confirmation { 123_456_789_012_345_678_901 }
    end

    trait :another do
      nickname { 'Another' }
    end
  end
end
