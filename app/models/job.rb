class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order("created_at DESC") }
  has_many :resumes

  def hide!
    self.is_hidden = true
    save
  end
  def publish!
    self.is_hidden = false
    save
  end
end
