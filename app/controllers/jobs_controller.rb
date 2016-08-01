class JobsController < ApplicationController

	before_action :authenticate_user!, only: [:edit, :new, :update, :destroy, :create]
	before_action :require_is_admin, only: [:edit, :new, :update, :destroy, :create]
	before_action :find_job_and_check_permit, only: [:edit, :destroy, :update]

	def index

		if params[:order] == "upperwage"
			@jobs = Job.all.where(:is_hidden => false).order("wage_upper_bound DESC")
		elsif params[:order] == "lowerwage"
			@jobs = Job.all.where(:is_hidden => false).order("wage_lower_bound DESC")
		elsif params[:order] == "date"
			@jobs = Job.all.where(:is_hidden => false).order("created_at DESC")
		else
			@jobs = Job.all.where(:is_hidden => false)
		end	
		
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.user = current_user

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
			redirect_to jobs_path
		else
			render :edit
		end
	end

	def show
		@job = Job.find(params[:id])

		if @job.is_hidden
			flash[:warning] = "This Job is already archived"
			redirect_to root_path
		end
	end

	def destroy
		@job.destroy

		redirect_to jobs_path
	end

	private

	def find_job_and_check_permit
		@job = Job.find(params[:id])
	end

	def job_params
		params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact, :is_hidden)
	end
end
