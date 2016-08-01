class Applicant::ResumesController < ApplicationController

	before_action :authenticate_user!
	layout 'applicant'

	def index
		@resumes = current_user.resumes
	end

	def show
		@resume = Resume.find(params[:id])
		@job = @resume.job
	end
end
