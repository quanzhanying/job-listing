class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_lower_bound, presence: true
  vaildates :wage_lower_bound,numericality: { greater-than： 0}
  validates :wage_upper_bound, presence: true
  validates :contact_email, presence: true
end
