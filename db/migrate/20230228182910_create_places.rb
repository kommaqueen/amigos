class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :category
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :photos
      t.text :description
      t.boolean :published
      t.string :age_range
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
