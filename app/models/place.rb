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

  multisearchable against: [:name, :category],
  using: {
    tsearch: { prefix: true }
  }

  def place_avg_rating
    avg = 0.00
    self.reviews.each do |r|
      avg += r.rating
    end
    self.reviews.empty? ? 0 : avg / self.reviews.length
  end

  def cleanliness
    cleanliness_array = self.reviews.pluck(:cleanliness)
    avg = cleanliness_array.sum / cleanliness_array.count.to_f
    self.reviews.empty? ? 0 : avg
  end

  def condition
    condition_array = self.reviews.pluck(:condition)
    avg = condition_array.sum / condition_array.count.to_f
    self.reviews.empty? ? 0 : avg
  end

  def fun_factor
    fun_factor_array = self.reviews.pluck(:fun_factor)
    avg = fun_factor_array.sum / fun_factor_array.count.to_f
    self.reviews.empty? ? 0 : avg
  end



end
