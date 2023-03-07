class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.references :users, null: false, foreign_key: true
      t.references :places, null: false, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
