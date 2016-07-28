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

class Job < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true

	validates :wage_lower_bound, numericality: { greater_than: 0}
	validates :wage_upper_bound, numericality: { greater_than: :wage_lower_bound}

end
