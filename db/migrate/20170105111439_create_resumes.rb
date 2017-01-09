class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.integer :user_id
      t.integer :job_id
      t.text :content

      t.timestamps
    end
  end
end
