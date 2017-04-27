class ChangeDataTypeForBirthday < ActiveRecord::Migration[5.0]
  def change
    change_column :infos, :birthdy, :date
  end
end
