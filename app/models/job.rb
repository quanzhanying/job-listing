class Job < ApplicationRecord
  belongs_to :user, required: false
end
