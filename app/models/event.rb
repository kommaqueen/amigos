class Event < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_one_attached :photo
  validates :title, :description, :category, :date, :start_time, :end_time, :event, presence: true
  validates :description, length: { minimum: 100 }
end
