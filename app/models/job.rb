class Job < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :job_relationships
  has_many :applicants, through: :job_relationships, source: :user
end
