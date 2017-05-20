class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates :contact_email, presence: true

  has_many :resumes

  scope :wage_lower_bound, -> { order("wage_lower_bound DESC") }
  scope :wage_upper_bound, -> { order("wage_upper_bound DESC") }
  scope :recent, -> { order("created_at DESC") }
  scope :published, -> { where(:is_hidden => false) }

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
