class Job < ApplicationRecord
  validates :title, :description, :salaryMin, :salaryMax, :contact , presence:true
  belongs_to :user
end
