class AddInfoToUserId < ActiveRecord::Migration[5.0]
  def change
    add_column :infos, :user_id, :integer
  end
end
