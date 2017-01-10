class Resume < ApplicationRecord
  validates :content, presence: true

  mount_uploader :attachment, AttachmentUploader

  belongs_to :user
  belongs_to :job
end
