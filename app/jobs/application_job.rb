class ApplicationJob < ActiveJob::Base
	validates :title, presence: true
end
