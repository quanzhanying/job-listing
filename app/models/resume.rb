class Resume < ApplicationRecord

  belongs_to :job
  belongs_to :user
  mount_uploader :attachment, AttachmentUploader
  validates :attachment, presence: true
  validates :content, presence: true



end
