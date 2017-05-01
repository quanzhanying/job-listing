class ChangeResumesPhonenuberTypeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :resumes, :phonenumber, :string
  end
end
