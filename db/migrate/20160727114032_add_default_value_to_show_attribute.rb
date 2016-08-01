class AddDefaultValueToShowAttribute < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :is_hidden, :boolean, default: true
  end
end
