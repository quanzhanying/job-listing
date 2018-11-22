class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  # mount_uploader :attachment, AttachmentUploader
  mount_uploader :attachment, AttachmentUploader
  validates :content, presence: true
end
