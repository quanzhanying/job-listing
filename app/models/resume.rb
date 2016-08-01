class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  mount_uploader :attachment,AttachmentUploader #Tells rails to use this for this model.

  validates :content,presence:true
end
