class CreateAdminJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_jobs do |t|

      t.timestamps
    end
  end
end
