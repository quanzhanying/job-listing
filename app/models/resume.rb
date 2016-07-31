# == Schema Information
#
# Table name: resumes
#
#  id                    :integer          not null, primary key
#  name                  :string
#  description           :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  job_id                :integer
#  user_id               :integer
#  pdf_file_file_name    :string
#  pdf_file_content_type :string
#  pdf_file_file_size    :integer
#  pdf_file_updated_at   :datetime
#

class Resume < ApplicationRecord
	belongs_to :job
	belongs_to :user

	has_attached_file :pdf_file
	validates_attachment_content_type :pdf_file, content_type: { content_type: 'application/pdf' }

	validates :name, presence: true
	validates :description, presence: true
end
