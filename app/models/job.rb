class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_under_bound, presence: true
  validates :wage_under_bound, numericality: { greater_than: 0}
end
