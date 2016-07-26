class JobsController < ApplicationController

	before_action :authenticate_admin!, only: [:new, :create, :update, :edit, :destroy]
	before_action :find_job_and_check_permit, only: [:destroy, :edit, :update]

	def index
		@jobs = Job.where(:is_hidden => false).order("created_at DESC")
	end

	def show
		@job = Job.find(params[:id])
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.admin = current_admin

		if @job.save
			redirect_to jobs_path
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		
		if @job.update(job_params)
			redirect_to jobs_path, notice: "Job Updated"
		else
			render :edit
		end
	end

	def destroy
		@job.destroy

		redirect_to jobs_path, alert: "Job Deleted"
	end



	private

	def find_job_and_check_permit
		@job = Job.find(params[:id])
	end

	def job_params
		params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact, :is_hidden)
	end
end
