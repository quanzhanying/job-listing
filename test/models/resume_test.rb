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

require 'test_helper'

class ResumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
