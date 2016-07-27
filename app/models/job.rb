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

class Job < ApplicationRecord

	validates :title, presence: true
	validates :description, presence: true

	validates :wage_upper_bound, numericality: true
	validates :wage_lower_bound, numericality: true

	belongs_to :admin

end
