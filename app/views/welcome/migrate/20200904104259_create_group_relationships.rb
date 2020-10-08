class CreateGroupRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :group_relationships do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
