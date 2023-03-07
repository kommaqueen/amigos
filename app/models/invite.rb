class Invite < ApplicationRecord
  belongs_to :users
  belongs_to :places
end
