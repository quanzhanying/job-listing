class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :isAdmin, :boolean, :default => false
  end
end
