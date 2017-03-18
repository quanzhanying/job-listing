class AddYunxingAndWeihuToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :is_yunxing, :boolean, default: false
    add_column :jobs, :is_ceshi, :boolean, default: false
  end
end
