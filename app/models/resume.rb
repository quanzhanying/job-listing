class Resume < ApplicationRecord
  mount_uploader :attatchment, AttatchmentUploader
  validates :content, presence:true
  belongs_to :job
  belongs_to :user
end
