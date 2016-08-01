# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  wage_upper_bound :integer
#  wage_lower_bound :integer
#  contact          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  is_hidden        :boolean          default(TRUE)
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
