class Job < ApplicationRecord
  validates :title, :wage_lower_bound, :wage_upper_bound, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, numericality: {greater_than: 0}

  has_many :resumes

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order("created_at DESC") }

  def hide!
    self.is_hidden = true
    self.save!
  end

  def publish!
    self.is_hidden = false
    self.save!
  end
end
