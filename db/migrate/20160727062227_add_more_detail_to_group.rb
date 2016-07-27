class AddMoreDetailToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :wage_upper_bound, :integer
    add_column :groups, :wage_lower_bound, :integer
    add_column :groups, :contact_email, :string
  end
end
