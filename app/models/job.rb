class Job < ApplicationRecord
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates :title, presence: true
  class Job < ApplicationRecord
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
