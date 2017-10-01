class AddSalaryMaxToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :salary_max, :integer
  end
end
