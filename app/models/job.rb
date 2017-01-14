class Job < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	has_many :job_relationships
  has_many :members, through: :job_relationships, source: :user
end
