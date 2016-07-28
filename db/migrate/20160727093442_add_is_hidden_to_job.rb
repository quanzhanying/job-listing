class AddIsHiddenToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :is_hidden, :boolean, default: true
  end
end
