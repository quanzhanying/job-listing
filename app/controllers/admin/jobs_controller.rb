class Admin::JobsController < ApplicationController
	before_action :authenticate_user!,  only: [:new, :create, :edit, :update, :destroy]
	before_action :require_is_admin

	def index
		@jobs = Job.all	
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.save

		redirect_to admin_jobs_path      
	end

	def show
		@job = Job.find(params[:id])
	end

	def edit
		@job = Job.find(params[:id])
	end

	def require_is_admin
		if current_user.email != 'wqy@163.com'
			flash[:alert] = 'You are not admin'
			redirect_to root_path
		end	
	end


	private

	def job_params
		params.require(:job).permit(:title,:description,:wage_upper_bound,:wage_lower_bound,:contact_email,:is_hidden)
	end
end
