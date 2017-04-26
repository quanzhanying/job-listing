class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  belongs_to :user
  has_many :resumes

  scope :recent, -> { order("created_at DESC")}
  scope :wage_low_down, -> { order("wage_lower_bound DESC")}
  scope :wage_low_up, ->  { order("wage_lower_bound ASC")}
  scope :wage_upper_down, -> { order("wage_upper_bound DESC")}
  scope :wage_upper_up, ->  { order("wage_upper_bound ASC")}
  scope :published, ->{ where (is_hidden: false) }

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

end
