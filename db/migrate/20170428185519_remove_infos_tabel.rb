class RemoveInfosTabel < ActiveRecord::Migration[5.0]
  def change
    remove_column :infos, :created_at
    remove_column :infos, :updated_at
    drop_table :infos
  end
end
