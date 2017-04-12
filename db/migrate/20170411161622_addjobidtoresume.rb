class Addjobidtoresume < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_id, :integer
    
  end
end
