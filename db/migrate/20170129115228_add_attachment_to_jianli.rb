class AddAttachmentToJianli < ActiveRecord::Migration[5.0]
  def change
    add_column :jianlis, :attachment, :string
  end
end
