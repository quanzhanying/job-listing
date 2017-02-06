class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  has_many :resumes
  has_many :candidates, through: :resumes, source: :user

  has_many :favor_job_relationships
  has_many :followers, through: :favor_job_relationships, source: :user

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }

end
