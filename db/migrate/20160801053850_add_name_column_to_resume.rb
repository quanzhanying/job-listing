class AddNameColumnToResume < ActiveRecord::Migration[5.0]
  def change
  	add_column :resumes, :name, :string
  end
end
