class Job < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :wage_upper_bound, presence: true
	validates :wage_lower_bound, presence: true
	validates :wage_upper_bound, numericality: { greater_than: 0}
	validates :wage_lower_bound, numericality: { greater_than: 0}
	#validates :number_is_right

	has_many :job_relationships
  has_many :members, through: :job_relationships, source: :user

	private

	def number_is_right
		errors.add(:wage_upper_bound, "should be more than lower bound") if wage_lower_bound >= wage_upper_bound
	end
end
