class AddIsHideToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :is_hide, :boolean, default:false
  end
end
