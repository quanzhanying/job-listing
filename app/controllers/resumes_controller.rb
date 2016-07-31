class ResumesController < ApplicationController

	before_action :authenticate_user!
	before_action :get_params, only: [:edit, :update, :destroy]

	def index
		@resumes = current_user.Resume.all
	end

	def show
		@resume = Resume.find(params[:id])
		@job = @resume.job
	end

	def new
		@resume = Resume.new
		@job = Job.find(params[:job_id])
	end

	def create
		@resume = Resume.new(resume_params)
		@job = Job.find(params[:job_id])
		@resume.job = @job
		@resume.user = current_user

		if @resume.save
			redirect_to jobs_path, notice: "Your resume has been submitted!"
		else
			render :new
		end
	end

	def edit
		@job = @resume.job
	end

	def update
		if @resume.update(resume_params)
			redirect_to applicant_resumes_path, notice: "Your resume has been updated!"
		else
			render :edit
		end
	end

	def destroy
		@resume.destroy
		redirect_to :back, alert: "Resume has been deleted!"
	end

	private

	def get_params
		@resume = Resume.find(params[:id])
	end

	def resume_params
		params.require(:resume).permit(:name, :description, :pdf_file)
	end

end
