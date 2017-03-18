class ChangeIntegerToTable < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :wage_upper_bound, :integer, limit: 8
    change_column :jobs, :wage_lower_bound, :integer, limit: 8
  end
end
