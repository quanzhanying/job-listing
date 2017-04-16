class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader

  validates :content, presence: true
  validates :attachment, presence: true
end
