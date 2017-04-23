class AddMoreDetailToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :work_place, :string
    add_column :jobs, :Company_name, :string
    add_column :jobs, :About_us, :string
    add_column :jobs, :Address, :string
  end
end
