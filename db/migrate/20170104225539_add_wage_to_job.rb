class AddWageToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :wage_upper_bound, :integer
    add_column :jobs, :wage_lower_bound, :integer
  end
end
