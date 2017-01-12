class AddCountToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :count, :integer
  end
end
