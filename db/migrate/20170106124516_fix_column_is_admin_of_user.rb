class FixColumnIsAdminOfUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :is_amdin, :is_admin
  end
end
