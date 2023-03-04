class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.integer :cleanliness
      t.integer :condition
      t.integer :age_appropriate
      t.integer :fun_factor

      t.timestamps
    end
  end
end
