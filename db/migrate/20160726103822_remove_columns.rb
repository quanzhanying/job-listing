class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs,:user_id
  end
end
