class AddPhoneToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phon, :string
  end
end
