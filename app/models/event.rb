class Event < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :invites
  has_many :attendances, dependent: :destroy
  has_one_attached :photo
  validates :title, :description, :category, :start_time, :end_time, presence: true
  validates :description, length: { minimum: 100 }

  include PgSearch::Model
  multisearchable against: [:title, :category, :public], if: :public?
end
