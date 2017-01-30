class AddMoreDetailToWork < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :wage_upper_bound, :integer
    add_column :works, :wage_lower_bound, :integer
    add_column :works, :contact_email, :string
  end
end
