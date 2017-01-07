class AddIsAdminDefaultValueToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :is_admin, :boolean, null: false, default: false
  end
end
