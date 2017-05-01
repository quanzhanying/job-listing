class Job < ApplicationRecord
  has_many :resumes
  
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

    scope :recent, -> { order('created_at DESC') }
    scope :published, ->  { where(is_hidden: false)}
end
