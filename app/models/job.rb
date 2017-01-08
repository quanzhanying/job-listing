class Job < ApplicationRecord
  validates :title, :wage_lower_bound, :wage_upper_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }
end
