class Place < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :events, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
