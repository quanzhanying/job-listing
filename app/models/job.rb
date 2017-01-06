class Job < ApplicationRecord
  validates :title,presence: true
  validates :wage_min,presence: true
  validates :wage_max,presence: true
  validates :wage_min,numericality: {greater_than: 0}
  validates :wage_max,numericality: {greater_than: 0}
  scope :recent, -> {order('updated_at DESC')}
end
