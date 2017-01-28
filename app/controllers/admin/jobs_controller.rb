class Admin::JobsController < ApplicationController
	before_action :require_is_admin
	before_action :authenticate_user!
	before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]
	layout "admin"

	def index
		@jobs = case params[:order]
		when 'by_lower_bound'
			Job.order("wage_lower_bound DESC")
		when 'by_upper_bound'
			Job.order("wage_upper_bound DESC")
		else
			Job.order("created_at DESC")
		end

	end

	def show
		@job = Job.find(params[:id])
			@resumes = @job.resumes.order("created_at DESC")
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
			redirect_to root_path, alert: "Sorry, you are not admin!"
		end
	end

	private
	def job_params
		params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
	end

	def find_job_and_check_permission
		@job = Job.find(params[:id])
		if !current_user.admin?
			redirect_to root_path, alert: "Sorry, you have no permission."
		end
	end

end
