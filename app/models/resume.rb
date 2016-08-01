class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :content, presence: true
  mount_uploader :attachment, AttachmentUploader #tell rails to use this uploader for this model.
end
