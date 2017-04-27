class Job < ApplicationRecord

  has_many :resumes

  # --收藏功能--
  has_many :collects
  has_many :members, through: :collects, source: :user

  # --已投功能--
  has_many :resume_relationship
  has_many :postmens, through: :resume_relationship, source: :user

  # ----------

  belongs_to :user
  validates :title, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  # ----------

  scope :published, -> {where(is_hidden: false)}
  scope :recent, -> {order('created_at DESC')}

  # ----------

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
