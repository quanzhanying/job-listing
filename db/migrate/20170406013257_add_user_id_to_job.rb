class AddUserIdToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :user_id, :integer
  end
end
