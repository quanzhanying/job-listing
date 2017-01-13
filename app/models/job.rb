class Job < ApplicationRecord
  validates :title, presence: true
  has_many :resumes

  scope :recent, -> { order('created_at DESC') }
  scope :lower, -> { order('wage_lower_bound DESC') }
  scope :upper, -> { order('wage_upper_bound DESC') }
  scope :published, -> { where(is_hidden: false) }

  def publish!
    self.is_hidden = false
    save
  end

  def hide!
    self.is_hidden = true
    save
  end
end
