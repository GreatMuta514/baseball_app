FactoryBot.define do
  factory :chat do
    body { SecureRandom.alphanumeric(100) } 
    association :user
    association :chatroom
  end
end
