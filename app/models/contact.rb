class Contact < ApplicationRecord
  enum subject: { bag_report: 0, others: 1 }

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :subject, presence: true
  validates :message, presence: true, length: { maximum: 400 }
end
