class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }
  has_many :resumes
  scope :recent, -> { order("created_at DESC")}
  scope :wage_up, -> { order('wage_upper_bound DESC')}
  scope :wage_down, ->{order('wage_lower_bound DESC')}
  scope :published, -> { where(is_hidden: false)}
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
