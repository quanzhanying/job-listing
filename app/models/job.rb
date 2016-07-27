class Job < ApplicationRecord
  validate :title, presence: true
end
