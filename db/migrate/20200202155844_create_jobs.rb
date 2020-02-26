class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :salary_max
      t.integer :salary_min

      t.timestamps
    end
  end
end
