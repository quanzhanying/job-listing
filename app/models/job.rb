class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :contact_email, presence: true
end
