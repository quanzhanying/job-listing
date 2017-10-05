class AddSalaryMinToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :salary_min, :integer
  end
end
