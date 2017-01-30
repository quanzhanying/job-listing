class AddIsHiddenToWork < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :is_hidden, :boolean, default: true
  end
end
