class ChangeMoreDetailToJob < ActiveRecord::Migration[5.0]
  def change
    rename_column :jobs, :contace_email, :contact_email
  end
end
