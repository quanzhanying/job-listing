class AddIsAdminToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_amdin, :boolean, default: false
  end
end
