class AddColumnsToInvites < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:invites, :users, index: true)
    remove_reference(:invites, :places, index: true)
    add_reference(:invites, :event, foreign_key: true)
    add_reference(:invites, :asker, foreign_key: {to_table: :users})
    add_reference(:invites, :receiver, foreign_key: {to_table: :users})
  end
end
