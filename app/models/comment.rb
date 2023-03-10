class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :content, length: {minimum: 10}, presence: true
end
