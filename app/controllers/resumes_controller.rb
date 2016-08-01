class ResumesController < ApplicationController
	
	before_action :authenticate_user!
	before_action :get_params, only: [:edit, :update, :destroy]

	def new
		@job = Job.find(params[:job_id])
		@resume = Resume.new
	end

	def create
		@resume = Resume.new(resume_params)
		@job = Job.find(params[:job_id])
		@resume.job = @job
		@resume.user = current_user 

		if @resume.save
			redirect_to job_path(@job), notice: "Your Resume has been submitted"
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		
		if @resume.update(resume_params)
			redirect_to job_path(@job), notice: "Your Resume has been updated"
		else
			render :edit
		end
	end

	def destroy
		@resume.destroy
		redirect_to 
	end


	private

	def get_params
		@resume = Resume.find(params[:id])
	end

	def resume_params
		params.require(:resume).permit(:content, :attachment)
	end
end
