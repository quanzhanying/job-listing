class AddIsHiddenToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :is_hidden, :boolean, default: true
  end
end
