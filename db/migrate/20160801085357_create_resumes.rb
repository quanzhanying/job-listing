class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.text :content
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
