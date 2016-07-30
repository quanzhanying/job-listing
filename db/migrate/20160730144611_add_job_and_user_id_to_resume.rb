class AddJobAndUserIdToResume < ActiveRecord::Migration[5.0]
  def change
  	add_column :resumes, :job_id, :integer
  	add_column :resumes, :user_id, :integer
  end
end
