# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  content    :text
#  job_id     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  attachment :string
#

class Resume < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  belongs_to :user
  belongs_to :job
  validates :content, presence: true
end
