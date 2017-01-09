class Job < ApplicationRecord

  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, mumericality: {greater_than: 0}
end
