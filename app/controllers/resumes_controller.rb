class ResumesController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'
  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.order('created_at DESC')
  end
end

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user
    if @resume.save
      flash[:notice] = "Submit successfully"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
