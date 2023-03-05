class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:reviews, :rating, 0)
  end
end
