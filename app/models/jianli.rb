class Jianli < ApplicationRecord
  belongs_to :user
  belongs_to :work




  validates :content, presence: true

  mount_uploader :attachment, AttachmentUploader
end
