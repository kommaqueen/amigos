class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.text :description
      t.boolean :public
      t.string :category
      t.date :date

      t.timestamps
    end
  end
end
