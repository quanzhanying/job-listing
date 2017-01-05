class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.text :descrtiption
      t.text :up
      t.text :down
      t.text :email

      t.timestamps
    end
  end
end
