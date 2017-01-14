class JobsController < ApplicationController
	before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
	before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]

	def index
		@jobs = Job.all
	end

	def show
		@job = Job.find(params[:id])
	end

	def eidt
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.user = current_user
		if @job.save
			redirect_to jobs_path, notice: "Job Created!"
		else
			render :new
		end
	end

	def update

		if @job.update(job_params)
			redirect_to jobs_path, notice:"Update Success!"
		else
			render :edit
		end
	end

	def destroy

		@job.destroy
		flash[:alert] = "Job Deleted!"
		redirect_to jobs_path
	end

	private
	def job_params
		params.require(:job).permit(:title, :description)
	end

	def find_job_and_check_permission
    @job = Job.find(params[:id])

    if current_user != @job.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

end
