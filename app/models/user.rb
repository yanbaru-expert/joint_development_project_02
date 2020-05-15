class User < ApplicationRecord
  validates :name, presence: true, length: { in: 1..15 }
  validates :age, presence: true,
            numericality: { only_integer: true }
end
