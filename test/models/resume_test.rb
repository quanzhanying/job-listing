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

require 'test_helper'

class ResumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
