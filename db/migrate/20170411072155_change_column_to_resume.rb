class ChangeColumnToResume < ActiveRecord::Migration[5.0]
  def change
    rename_column :resumes, :name, :content
  end
end
