class AddPracticeToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :practice, :boolean, default: true
  end
end
