class RemoveInfoIdFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :info_id
  end
end
