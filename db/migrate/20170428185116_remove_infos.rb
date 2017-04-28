class RemoveInfos < ActiveRecord::Migration[5.0]
  def change
    remove_column :infos, :birthdy
    remove_column :infos, :gender
    remove_column :infos, :nickname
    remove_column :infos, :motto
    remove_column :infos, :user_id
  end
end
