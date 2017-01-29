class Job < ActiveRecord::Base

  scope :published, -> { where(is_hidden: false)}
  scope :recent, -> { order('created_at DESC')}
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

end
