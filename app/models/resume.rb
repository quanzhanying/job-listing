class Resume < ApplicationRecord
  validates :attachment, presence: true
  mount_uploader :attachment, AttachmentUploader

  belongs_to :job
  belongs_to :user
end
