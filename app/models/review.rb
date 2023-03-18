class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :cleanliness, :condition, :age_appropriate, :fun_factor, :comment, presence: true
  validates :comment, length: { minimum: 20 }
end
