class AddEmainToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :email, :string
  end
end
