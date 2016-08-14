class ResumesController < ApplicationController
  before_action :authenticate_user!
  def index
    @job = Job.find(params[:job_id])
    @resumes = Resume.all
  end

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to job_path(@job), notice: "The resume #{@resume.name} has been uploaded."
    else
      render :new
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
