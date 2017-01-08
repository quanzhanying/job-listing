class ModifyHiddenDefaultToFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :hidden, :boolean, default: false
  end
end
