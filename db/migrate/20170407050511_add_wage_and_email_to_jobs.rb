class AddWageAndEmailToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :wage_upper_bound, :integer
    add_column :jobs, :wage_under_bound, :integer
    add_column :jobs, :contact_email, :string
  end
end
