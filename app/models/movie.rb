class Movie < ApplicationRecord
    validates :title, presence: true

    validates :douban, numericality: { greater_than: 0}
end
