class Resume < ApplicationRecord
  validates :content, presence: true
  mount_uploader :attachment, AttachmentUploader

  belongs_to :job
  belongs_to :user
end
