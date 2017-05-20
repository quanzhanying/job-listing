class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader

  validates :content, presence: true

  scope :recent, -> { order("created_at DESC") }
end
