class Job < ApplicationRecord
  validates :title , presence: true
  validates :description , presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  belongs_to :user
  belongs_to :category
  has_many :resumes
  scope :published, -> {where(is_hidden:false)}
  scope :recent, -> {order('created_at DESC')}

  def hide!
    self.is_hidden = true
    self.save
  end

  def publish!
    self.is_hidden = false
    self.save
  end

  def self.search(search)
    where("description LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%")
  end
  
end
