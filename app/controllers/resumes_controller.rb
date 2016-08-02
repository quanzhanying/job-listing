class ResumesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  def index
    @resumes = Resume.all
  end

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def show
    @job = Job.find(params[:id])
    @resumes = @job.resumes
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user
  if  @resume.save
    redirect_to job_path(@job), notice: "Upload Success"
  else
    render :new
  end
end


  def update
    @resume = Resume.find(param[:id])
    if @resume.update(resume_params)
      redirect_to job_resumes_path, alert: "Resume update"
    else
      render :edit
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to job_resumes_path, alert: "Resume deleted"
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
