class Job < ApplicationRecord
  validates :title, :description, :salaryMin, :salaryMax, :contact , presence:true
end
