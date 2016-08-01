class AddWageLowerBoundToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs,:wage_lower_bound,:bigdecimal
  end
end
