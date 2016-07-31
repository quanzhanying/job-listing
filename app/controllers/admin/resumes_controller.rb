class Admin::ResumesController < ApplicationController

	before_action :authenticate_user!
	before_action :require_is_admin
	before_action :get_params, only: [:edit, :update, :destroy]

	def index
		@jobs = current_user.jobs
	end
end
