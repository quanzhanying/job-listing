class ChangeJobIsHiddenDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:jobs, :is_hidden, false)
  end
end
