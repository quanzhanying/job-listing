class AddMoreWageDetailToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :wage_upper_bound, :interger
    add_column :jobs, :wage_lower_bound, :interger
    add_column :jobs, :email, :string
  end
end
