class Resume < ApplicationRecord
  belongs_to :job
  belongs_to :user

  mount_uploader :attachment, AttachmentUploader
  validates :content, presence: true
  validates :attachment, presence: true
end
