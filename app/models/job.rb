class Job < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: {greater_than: 0}

  scope :show_public, -> { where("is_hidden = 'false'") }
  scope :recent, -> { order(created_at: :desc) }
end
