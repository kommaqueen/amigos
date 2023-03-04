class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :places
  has_one_attached :photo
  validates :first_name, :last_name, :username, :bio, :location, presence: true
  validates :username, uniqueness: true
  validates :bio, length: { minimum: 200 }
end
