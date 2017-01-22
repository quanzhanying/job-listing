class Job < ApplicationRecord
  has_many :resumes
  validates :title, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_upper_bound, presence: true

  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates :wage_upper_bound, numericality: { greater_than: 0}
  def publish!
    self.is_hidden = false
    self.save
  end
  def hide!
    self.is_hidden = true
    self.save
  end
end
