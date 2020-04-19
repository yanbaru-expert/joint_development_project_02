class Task < ApplicationRecord
  validates :title, presence: true, length: { in: 1..30 }
  validates :detail, presence: true, length: { in: 1..50 }
end
