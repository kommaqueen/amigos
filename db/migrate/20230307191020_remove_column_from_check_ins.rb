class RemoveColumnFromCheckIns < ActiveRecord::Migration[7.0]
  def change
    remove_column :check_ins, :public, :boolean
    remove_column :check_ins, :date, :datetime
  end
end
