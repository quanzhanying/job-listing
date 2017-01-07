class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: {greater_that: 0}
  belongs_to :user
  scope :recent, -> {order("created_at DESC")}
end
