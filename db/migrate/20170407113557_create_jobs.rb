class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :salaryMax
      t.integer :salaryMin
      t.text :contact
      t.boolean :hide

      t.timestamps
    end
  end
end
