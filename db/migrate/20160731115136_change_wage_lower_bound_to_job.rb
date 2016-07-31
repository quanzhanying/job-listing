class ChangeWageLowerBoundToJob < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :wage_lower_bound, :integer
  end
end
