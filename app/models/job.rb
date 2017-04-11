class Job < ApplicationRecord
  validates :title, presence:true
  validates :description, presence:true
  validates :salaryMin, presence:true , numericality:{greater_than:0}
  validates :salaryMax, presence:true , numericality:{greater_than:0}
  belongs_to :user
end
