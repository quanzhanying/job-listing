# == Schema Information
#
# Table name: resumes
#
#  id                    :integer          not null, primary key
#  name                  :string
#  description           :text
#  pdf_file_file_name    :string
#  pdf_file_content_type :string
#  pdf_file_file_size    :integer
#  pdf_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  job_id                :integer
#  user_id               :integer
#

class Resume < ApplicationRecord
	belongs_to :job
	belongs_to :user
end
