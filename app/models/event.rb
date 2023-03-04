class Event < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_one_attached :photo
  validates :title, :description, :category, :start_time, :end_time, :public, presence: true
  validates :description, length: { minimum: 100 }
end
