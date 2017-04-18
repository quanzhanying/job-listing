class Admin::JobsController < ApplicationController
	before_action :authenticate_user!,  only: [:new, :create, :edit, :update, :destroy, :index]
	before_action :require_is_admin
	before_action :find_job, only: [:show, :edit, :update, :destroy]
	layout "admin"

	def index
		# @jobs = Job.where(:is_hidden => false).recent
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
    	@job = Job.new(job_params)
    	@job.user = current_user

    	if @job.save
      		redirect_to admin_jobs_path
    	else
      		render :new
    	end
  	end

	def show
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

	def destroy
		if @job.destroy

			redirect_to admin_jobs_path
		else
			# 如果删除时候还是回到index界面
			render :index
		end
	end

	def publish
		@job = Job.find(params[:id])
		@job.publish!
		redirect_to :back
	end

	def hide
		@job = Job.find(params[:id])
		@job.hide!
		redirect_to :back
	end



	private
	def job_params
		params.require(:job).permit(:title,:description,:wage_upper_bound,:wage_lower_bound,:contact_email,:is_hidden)
	end

	def find_job
		@job = Job.find(params[:id])
	end
end
