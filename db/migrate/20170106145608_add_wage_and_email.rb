class AddWageAndEmail < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :wage_min, :integer, null: false
    change_column :jobs, :wage_max, :integer, null: false

  end
end
