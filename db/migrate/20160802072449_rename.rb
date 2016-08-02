class Rename < ActiveRecord::Migration[5.0]
  def change
    rename_column :resumes, :job_id, :group_id
  end
end
