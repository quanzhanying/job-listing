class AddHiddenToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_hidden, :boolean, default: true
  end
end
