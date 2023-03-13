class AddStatusToInvites < ActiveRecord::Migration[7.0]
  def change
    add_column :invites, :status, :integer, default: 0
  end
end
