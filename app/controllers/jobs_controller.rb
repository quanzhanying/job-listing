class JobsController < ApplicationController
	before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
	before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]
	before_action :require_is_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
		@jobs = Job.where(:is_hidden => false).order("created_at DESC")
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
			redirect_to admin_jobs_path, notice: "Job Created!"
		else
			render :new
		end
	end

	def update

		if @job.update(job_params)
			redirect_to admin_jobs_path, notice:"Update Success!"
		else
			render :edit
		end
	end

	def destroy

		@job.destroy
		flash[:alert] = "Job Deleted!"
		redirect_to admin_jobs_path
	end

	def require_is_admin
		if !current_user.admin?
			redirect_to root_path, alert: "You are not admin!"
		end
	end

	private
	def job_params
		params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
	end

	def find_job_and_check_permission
    @job = Job.find(params[:id])

    if current_user != @job.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

end
