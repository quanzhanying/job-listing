# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  wage_upper_bound :integer
#  wage_lower_bound :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  contact          :string
#  admin_id         :integer
#  is_hidden        :boolean
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
