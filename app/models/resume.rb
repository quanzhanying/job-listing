class Resume < ApplicationRecord

  validates :content, presence: true

  belongs_to :job
  belongs_to :user

  mount_uploader :attachment, AttachmentUploader
end
