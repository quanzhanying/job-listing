class AddContactToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :contact, :string
  end
end
