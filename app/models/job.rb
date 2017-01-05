class Job < ApplicationRecord
  belongs_to :user, required: false
  validates :title, presence: true
end
