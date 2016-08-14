class Resume < ApplicationRecord
  validates :name, presence: true
  validates :attachment, presence: true
  mount_uploader :attachment, AttachmentUploader
end
