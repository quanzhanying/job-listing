class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :resume_relationship

  mount_uploader :attachment, AttachmentUploader
  validates :content, presence: true
end
