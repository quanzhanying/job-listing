class ResumesController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create,:edit,:update,:destroy]
  before_action :require_is_admin

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes
  end

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    @resume.job = @job
    if @resume.save
      redirect_to job_path(@job),notice:"提交简历成功"
    else
      flash[:alert] =  "上传出错！"
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
      redirect_to job_resumes_path(@job),notice: "Update resume Success"
    else
      flash[:alert] =  "上传出错！"
      #如何让不同错误提示不同错误信息
      render :edit
    end
  end

  def show
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
  end

  private

  def resume_params
    params.require(:resume).permit(:content,:user_id,:job_id,:attachment)
  end
end
