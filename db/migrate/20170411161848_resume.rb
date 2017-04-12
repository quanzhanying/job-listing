class Resume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :job_id, :integer
  end
end
