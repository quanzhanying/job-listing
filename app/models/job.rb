class Job < ApplicationRecord

	validates :title, presence: true
	validates :description, presence: true
	
	validates :wage_upper_bound, presence: true
	validates :wage_lower_bound, presence: true

	validates :wage_upper_bound, numericality: true
	validates :wage_lower_bound, numericality: true
end
