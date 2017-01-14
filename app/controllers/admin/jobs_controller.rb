class Admin::JobsController < ApplicationController
	before_action :authenticate_user!

	def index
		@jobs = current_user.jobs.order("created_at DESC")
	end


end
