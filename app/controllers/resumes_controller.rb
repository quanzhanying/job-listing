class ResumesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @resumes = Resume.all
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
      redirect_to job_path(@job), notice: "The resume has been uploaded"
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to admin_job_path(@job), alert: "Resume deleted"
  end

  private

  def resume_params
    params.require(:resume).permit(:attachment, :content)#为要上传的字段
  end

end
