class Place < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :check_ins, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  acts_as_favoritable




  include PgSearch::Model

  multisearchable against: [:name, :category]

  def place_avg_rating
    avg = 0.00
    self.reviews.each do |r|
      avg += r.rating
    end
    self.reviews.empty? ? 0 : avg / self.reviews.length
  end

end
