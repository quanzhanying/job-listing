class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader
  validates :attachment, file_size: { less_than_or_equal_to: 2.megabyte },
                             file_content_type: { allow: 'application/pdf' }

  validates :content, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
