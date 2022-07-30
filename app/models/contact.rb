class Contact < ApplicationRecord
  enum subject: { bag_report: 0, others: 1 }
end
