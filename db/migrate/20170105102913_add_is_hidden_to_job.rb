class AddIsHiddenToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :is_hidden_1, :boolean, default: true
  end
end
