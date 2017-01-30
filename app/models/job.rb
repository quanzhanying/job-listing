class Job < ApplicationRecord

  has_many :resumes
  scope :recent, -> { order('created_at DESC') }

  scope :published, -> { where(is_hidden: false) }

  validates :title, presence: true

  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
end
