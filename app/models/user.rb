require "open-uri"
# require "pry-byebug"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :places, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :check_ins, dependent: :destroy
  has_one_attached :photo
  validates :username, :bio, :location, presence: true
  validates :username, uniqueness: true
  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id, dependent: :destroy
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id, dependent: :destroy
  has_many :invites_as_asker, class_name: "Friendship", foreign_key: :asker_id, dependent: :destroy
  has_many :invites_as_receiver, class_name: "Friendship", foreign_key: :receiver_id, dependent: :destroy
  has_many :attendances, dependent: :destroy
  after_validation :attach_default_image

  include PgSearch::Model
  pg_search_scope :search_by_name_and_username,
  against: [ :first_name, :last_name, :username ],
  using: {
    tsearch: { prefix: true }
  }
  acts_as_favoritor

  def friends
    user_ids = friendships_as_asker.pluck(:receiver_id) + friendships_as_receiver.pluck(:asker_id)
    User.where(id: user_ids)
  end

  def friends_with?(user)
    friendships_as_asker.find_by(receiver_id: user.id) || friendships_as_receiver.find_by(asker_id: user.id)
  end

  def format_name
    "#{first_name} #{last_name} - #{username}"
  end

  def attach_default_image
    unless self.photo.attached?
      url = "https://robohash.org/#{self.username}.png"
      file = URI.open(url) # use cloudinary url
      self.photo.attach(io: file, filename: 'image.png', content_type: "image/png")
    end
  end
end
