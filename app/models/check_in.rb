class CheckIn < ApplicationRecord
  belongs_to :users
  belongs_to :places
end
