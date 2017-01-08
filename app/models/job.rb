class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates :contact_email, presence: true

  scope :recent, -> { order("created_at DESC")}

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
