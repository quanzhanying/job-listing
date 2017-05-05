class DropUsersInfo < ActiveRecord::Migration[5.0]
  def change
    def up
      drop_column :users, :info_id
    end
  end
end
