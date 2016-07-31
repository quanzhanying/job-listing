class AddAttachmentPdfFileToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :pdf_file
    end
  end

  def self.down
    remove_attachment :resumes, :pdf_file
  end
end
