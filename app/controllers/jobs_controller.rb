class JobsController < ApplicationController
	before_filter :authenticate_user!,only: [:new,:create,:destroy,:edit]
	before_filter :require_is_admin,only: [:new,:create,:destroy,:edit]
	def index
		@jobs= Job.all
	end

	def show
		@job= Job.find(params[:id])
	end

	def new
		@job= Job.new
	end

	def create
		@job= Job.new(job_params)
		if @job.save
			redirect_to jobs_path, notice:"Create a job successfully!"
		else
			render :new
		end
	end

	def edit
		@job= Job.find(params[:id])
	end

	def update
		@job= Job.find(params[:id])
		if @job.update(job_params)
			redirect_to jobs_path, warning: "Update successfully!"
		else
			render :edit
		end	
	end


	def destroy
		@job= Job.find(params[:id])
		if @job.destroy
			redirect_to jobs_path, alert: "Delete successfully!"
		end
	end

private

def job_params
	params.require(:job).permit(:title,:description)
end

def require_is_admin
	# if !current_user.admin?
	# 	redirect_to root_path,alert: "You are not admin!"
	# end
	unless current_user.admin?
		redirect_to jobs_path, alert: "You are not admin!"
	end
end

end
