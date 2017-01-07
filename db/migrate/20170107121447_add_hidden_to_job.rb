class AddHiddenToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :hidden, :boolean
  end
end
