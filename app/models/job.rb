class Job < ActiveRecord::Base
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }

  has_many :resumes

  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }
  validates :contact_email, presence: true

  def publish!
    self.is_hidden = false
    save
  end

  def hide!
    self.is_hidden = true
    save
  end
end
