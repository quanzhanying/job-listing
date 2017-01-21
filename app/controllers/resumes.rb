class JobsController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create]

	def new
		@job = Job.find(params[:job_id])
		@resume = Resume.new
	end

	def create
		@job = Job.find(params[:job_id])
		@resume = Resume.new(resume_params)
		@resume.job = @job
		@post.user = current_user

		if @post.save
			redirect_to job_path(@job)
		else
			render :new
		end
	end


	private

	def post_params
		params.require(:post).permit(:content)
	end

end
