FactoryBot.define do
  factory :contact do
    email { "sample@example.com" }
    subject { 0 }
    message { SecureRandom.alphanumeric(400) }

    trait :too_long_message do
      message { SecureRandom.alphanumeric(401) }
    end
  end
end
