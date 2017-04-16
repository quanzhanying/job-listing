class Job < ApplicationRecord

	belongs_to :user
	validates :title, presence: true
	validates :wage_upper_bound, numericality: true
	# validates :wage_lower_bound, presence: true   如果对一个栏位的属性写两个validates 只有前一个会起作用
	validates :wage_lower_bound, numericality: { greater_than: 0}

	scope :recent, -> { order("created_at DESC")}

	def publish!
		self.is_hidden = false
		self.save
	end

	def hide!
		self.is_hidden = true
		self.save
	end
end
