class JobsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			redirect_to jobs_path, notice: "Create a new job"
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
			redirect_to jobs_path, notice: "Update the job"
		else
			render :edit
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to jobs_path, alert: "Job deleted"
	end

	private

	def job_params
		params.require(:job).permit(:title, :description)
	end	
end
