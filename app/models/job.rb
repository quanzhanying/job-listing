class Job < ApplicationRecord
	validates :title, :description, presence: true
end
