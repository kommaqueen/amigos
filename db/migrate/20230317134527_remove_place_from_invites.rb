class RemovePlaceFromInvites < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:invites, :place, index: true, foreign_key: true)
  end
end
