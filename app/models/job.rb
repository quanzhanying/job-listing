class Job < ApplicationRecord
  validates :title , presence: true
  validates :description , presence: true
  belongs_to :user
end
