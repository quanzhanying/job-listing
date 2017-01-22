class Resume < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader
end
