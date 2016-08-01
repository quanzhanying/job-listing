class Applicant::ResumesController < ApplicationController

	before_action :authenticate_user!
	before_action :get_params, only: [:edit, :update]
	layout 'applicant'

	def index
		@resumes = current_user.resumes
	end

	def show
		@resume = Resume.find(params[:id])
	end

	def edit
		@job = @resume.job
	end

	def update
		
		@job = @resume.job
		if @resume.update(resume_params)
			redirect_to applicant_resumes_path, notice: "Your Resume has been Updated"
		else
			render :edit
		end
	end


	private

	def get_params
		@resume = Resume.find(params[:id])
	end

	def resume_params
		params.require(:resume).permit(:content, :attachment, :name)
	end

end
