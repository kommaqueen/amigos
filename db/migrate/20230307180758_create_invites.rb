class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.boolean :accepted

      t.timestamps
    end
  end
end
