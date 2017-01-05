class AddAdminIdToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :admin_id, :integer
  end
end
