class Job < ApplicationRecord
  scope :recent, -> { order('created_at DESC') }
end
  scope :published, -> { where(is_hidden: false) }
end
  validates :title, presence: true

  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
end
