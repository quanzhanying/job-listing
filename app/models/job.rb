class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true, numericality: { greater_than: 0}
  validates :wage_lower_bound, presence: true
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
