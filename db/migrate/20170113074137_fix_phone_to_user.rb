class FixPhoneToUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :phon, :phone
  end
end
