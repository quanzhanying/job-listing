# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  job_id     :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates :content, presence: true
end
