class AddAllToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :is_houduan, :boolean, default: false
    add_column :jobs, :is_quanzhan, :boolean, default: false
    add_column :jobs, :is_chanpin, :boolean, default: false
    add_column :jobs, :is_mishu, :boolean, default: false
    add_column :jobs, :is_shouhou, :boolean, default: false
  end
end
