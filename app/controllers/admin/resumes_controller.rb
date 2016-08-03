class Admin::ResumesController < ApplicationController

	before_action :authenticate_user!
	before_action :require_is_admin
	before_action :get_params, only: [:edit, :update, :destroy]
	layout 'admin'

	def index
		@jobs = Job.all
	end

	def show
		@resume = Resume.find(params[:id])
	end
end
