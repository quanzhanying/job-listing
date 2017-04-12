class Resume < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :attachment, presence: true # Make sure the owner's name is present.
  validates :title, presence: true 
  belongs_to :job

end
