class AddDetailsToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :wage_upper_bound, :number
    add_column :jobs, :wage_lower_bound, :number
    add_column :jobs, :contact_email, :string
  end
end
