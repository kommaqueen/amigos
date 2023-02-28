class RemovePhotosFromPlaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :places, :photos, :string
  end
end
