class Job < ApplicationRecord
  validates :title, presence:true
  validates :description, presence:true
  validates :salaryMin, presence:true , numericality:{greater_than:0}
  validates :salaryMax, presence:true , numericality:{greater_than:0}
  belongs_to :user
  has_many :resumes
  ransack_alias :searchjob, :title_or_description

  self.per_page = 5

end
