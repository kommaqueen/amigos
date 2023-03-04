class Place < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :events, dependent: :destroy
end
