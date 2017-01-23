class AddIsQianduanToController < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :is_qianduan, :boolean, default: false
  end
end
