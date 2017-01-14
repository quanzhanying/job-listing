class ChangeColumnDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :is_admin, false
  end
end
