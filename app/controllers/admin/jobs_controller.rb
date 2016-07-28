class Admin::JobsController < ApplicationController

	before_action :authenticate_user!, only: [:edit, :new, :update, :destroy, :create]
	before_action :require_is_admin
	before_action :find_job_and_check_permit, only: [:edit, :destroy, :update]

	def index
		@jobs = Job.all.order("created_at DESC")
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)

		if @job.save
			redirect_to admin_jobs_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		
		if @job.update(job_params)
			redirect_to admin_jobs_path
		else
			render :edit
		end
	end

	def show
		@job = Job.find(params[:id])
	end

	def destroy
		@job.destroy

		redirect_to admin_jobs_path
	end

	private

	def find_job_and_check_permit
		@job = Job.find(params[:id])
	end


	def job_params
		params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact)
	end
end
