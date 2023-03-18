class RemoveUserFromInvites < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:invites, :user, index: true, foreign_key: true)
  end
end
