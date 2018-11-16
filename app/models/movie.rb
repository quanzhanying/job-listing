class Movie < ApplicationRecord
    validates :title, presence: true
    
end
