class ResumesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]


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
      redirect_to job_path(@job), notice: "The resume #{@resume.content} has been uploaded"
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
  end

  def update
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])

    if @resume.update(resume_params)
      redirect_to job_path(@job), notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to job_path(@job), notice: "The resume #{@resume.content} has been deleted"
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
