class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: {greater_than: 0}
  validates :wage_upper_bound, numericality: {greater_than: :wage_lower_bound}

  belongs_to :user
  has_many :companies
  has_many :members, through: :companies, source: :user
end
