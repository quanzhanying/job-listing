class AddUserToInfoId < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :info_id, :integer
  end
end
