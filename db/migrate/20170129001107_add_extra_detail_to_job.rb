class AddExtraDetailToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :author, :string
  end
end
