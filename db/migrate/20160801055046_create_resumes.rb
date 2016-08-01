class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.text :content

      t.timestamps
    end
  end
end
