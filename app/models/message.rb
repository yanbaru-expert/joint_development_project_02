class Message < ApplicationRecord
  validates :name, presence: true, length: { in: 1..15 }
  validates :content, presence: true, length: { in: 1..50 }
end
