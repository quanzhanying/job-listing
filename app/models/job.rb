class Job < ApplicationRecord
  validates :title, presence: true
  validates :salary_max, presence: true
  validates :salary_min, presence: true
  validates :salary_min, numericality: {greater_than: 0}

  belongs_to :user
end
