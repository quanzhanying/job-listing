class JobsController < ApplicationController
  

  # 首页
  def index
    @jobs = Job.all
  end

  # 新建
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  # 查看
  def show
    @job = Job.find(params[:id])
  end

  # 编辑
  def edit
    @job = Job.find(params[:id])
  end
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: "数据已更新！"
    else
      render :edit
    end
  end

  # 删除
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "该条记录已删除！"
    redirect_to jobs_path
  end

  # private def
  private
    def job_params
      params.require(:job).permit(:title, :description)
    end
end
