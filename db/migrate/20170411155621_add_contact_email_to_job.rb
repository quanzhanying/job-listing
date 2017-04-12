class AddContactEmailToJob < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :contact_email, :text
  end
end
