class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :wage_upper_bound
      t.integer :wage_lower_bound
      t.text :contact

      t.timestamps
    end
  end
end
