class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  def hide!
    self.is_hidden = true
    self.save
  end
  def publish!
    self.is_hidden = false
    self.save
  end
end
