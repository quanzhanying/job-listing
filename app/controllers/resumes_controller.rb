class ResumesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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
      flash[notice] = "成功提交简历"
      redirect_to job_path(@job)
    else
      redirect_to :new
    end
  end


  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end

end
