class Admin::JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_is_admin
	def index
		@jobs = Job.all
	end

	def show
		@job = Job.find(params[:id])
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			redirect_to admin_jobs_path, notice: "Creat a new job"
		else
			render :new
		end
	end

	def edit
		@job = Job.find(params[:id])
	end

	private

	def job_params
		params.require(:job).permit(:title, :description)
	end
end
