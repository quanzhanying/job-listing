class AddIsAdminToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_admin, :booleadn, default: false
  end
end
