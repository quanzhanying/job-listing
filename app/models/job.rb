class Job < ApplicationRecord
	validates :title, :description, presence: true
	validates :wage_lower_bound, numericality: { greater_than: 0 }
end
