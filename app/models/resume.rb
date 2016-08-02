class Resume < ApplicationRecord

  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader
  validates :name, :content, presence: true

end
