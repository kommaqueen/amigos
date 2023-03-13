class RemoveAcceptedFromInvites < ActiveRecord::Migration[7.0]
  def change
    remove_column :invites, :accepted, :boolean
  end
end
