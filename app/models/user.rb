class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :places, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :check_ins, dependent: :destroy
  has_one_attached :photo
  validates :first_name, :last_name, :username, :bio, :location, presence: true
  validates :username, uniqueness: true
  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id
end
