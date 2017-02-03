class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    drop_table :jobs
    create_table :jobs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
