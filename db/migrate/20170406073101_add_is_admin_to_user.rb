class AddIsAdminToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_admin, :boolean, default: false
    # is_admin设置成boolean类型，默认是false
  end
end
