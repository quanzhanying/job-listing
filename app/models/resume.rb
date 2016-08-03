class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :group 

  mount_uploader :attachment, AttachmentUploader

  validates :content, presence: true
end
