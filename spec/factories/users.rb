FactoryBot.define do
  factory :user do
    nickname { "Sample" }
    sequence(:email) { |n| "sample#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }

    trait :too_little_password do
      password { "1234567" }
      password_confirmation { "1234567" }
    end

    trait :too_many_password do
      password {123456789012345678901}
      password_confirmation {123456789012345678901}
    end

    trait :another do
      nickname { "Another" }
    end
  end

end
