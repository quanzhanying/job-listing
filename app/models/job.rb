class Job < ApplicationRecord
  validates :title, presence:true
end
