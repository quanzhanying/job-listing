class AddAdminIdToJob < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :admin_id, :integer
  end
end
