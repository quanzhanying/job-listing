class CreateJianlis < ActiveRecord::Migration[5.0]
  def change
    create_table :jianlis do |t|
      t.integer :work_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
