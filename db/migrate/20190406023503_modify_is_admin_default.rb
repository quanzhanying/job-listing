class ModifyIsAdminDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :is_admin, :boolean, :default => false
  end
end
