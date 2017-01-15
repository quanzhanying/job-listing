class AddMoreDetailToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :wage_upper_bound, :integer
    add_column :jobs, :wage_lower_bound, :integer
    add_column :jobs, :contact_email, :string
    add_column :jobs, :contact_phone, :string
  end
end
