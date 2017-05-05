class AddResumeIdToResumeRelationship < ActiveRecord::Migration[5.0]
  def change
    add_column :resume_relationships, :resume_id, :integer
  end
end
