class AddColumnToCheckIns < ActiveRecord::Migration[7.0]
  def change
    add_column :check_ins, :date, :datetime
  end
end
