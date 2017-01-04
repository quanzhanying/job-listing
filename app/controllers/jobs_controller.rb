class JobsController < ApplicationController
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

	private

	def job_params
		params.require(:job).permit(:title, :description)
	end	
end
