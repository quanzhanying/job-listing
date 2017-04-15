class AddIdToResumes < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :job_id, :integer
    add_column :resumes, :resume_id, :integer
  end
end
