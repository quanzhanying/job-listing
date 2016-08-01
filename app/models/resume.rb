# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  attachment :string
#  name       :string
#

class Resume < ApplicationRecord
	belongs_to :user
	belongs_to :job

	validates :content, presence: true
	validates :name, presence: true

	mount_uploader :attachment, PdFfileUploader
end
