class Movie < ApplicationRecord
    validates :title, presence: true

    validates :douban, numericality: { greater_than: 0}
    has_many :resumes
    def publish!
      self.is_hidden = false
      self.save
    end

    def hide!
      self.is_hidden = true
      self.save
    end

    scope :published, -> { where(is_hidden: false)}
    scope :recent, -> { order('created_at DESC')}

end
