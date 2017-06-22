class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  has_many :resumes


    scope :published, -> { where(is_hidden: false) }
    scope :recent, -> { order('created_at DESC') }
    scope :random5, -> { limit(5).order("RANDOM()")}
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  def self.search(search)
    where("title LIKE ?", "%#{search}%").or(where("description LIKE ?", "%#{search}%"))
  end

end
