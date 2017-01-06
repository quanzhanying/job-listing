class Job < ApplicationRecord
  validates :title,presence: true
  scope :recent, -> {order('updated_at DESC')}
end
