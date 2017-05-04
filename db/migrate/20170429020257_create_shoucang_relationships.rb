class CreateShoucangRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :shoucang_relationships do |t|
      t.integer :job_id
      t.integer :user_id

      t.timestamps
    end
  end
end
