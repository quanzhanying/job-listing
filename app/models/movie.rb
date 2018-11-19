class Movie < ApplicationRecord
    validates :title, presence: true

    validates :douban, numericality: { greater_than: 0}

    def publish!
      self.is_hidden = false
      self.save
    end

    def hide!
      self.is_hidden = true
      self.save
    end
end
