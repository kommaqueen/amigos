class CreateCheckIns < ActiveRecord::Migration[7.0]
  def change
    create_table :check_ins do |t|
      t.references :users, null: false, foreign_key: true
      t.references :places, null: false, foreign_key: true
      t.boolean :public

      t.timestamps
    end
  end
end
