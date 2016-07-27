class Admin::JobsController < ApplicationController

	before_action :authenticate_admin!

	def index
		@jobs = current_admin.jobs.order("created_at DESC")
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.admin = current_admin

		if @job.save
			redirect_to admin_jobs_path
		else
			render :new
		end
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		
		if @job.update(job_params)
			redirect_to admin_jobs_path, notice: "Updated"
		else
			render :edit
		end
	end

	def destroy
		@job = Job.find(params[:id])

		@job.destroy

		redirect_to admin_jobs_path, alert: "Job Deleted"
	end


	private

	def job_params
		params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact, :is_hidden)
	end

end
