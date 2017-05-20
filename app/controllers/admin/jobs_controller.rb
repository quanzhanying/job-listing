class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  layout "sidebar"

  # 首页 R
  def index
    @jobs = Job.all
  end

  # 查看 R
  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      flash[:warning] = "该条记录属于档案，无法查看！"
      redirect_to admin_jobs_path
    end
  end

  # 新建 C
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  # 编辑 U
  def edit
    @job = Job.find(params[:id])
  end
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "数据已更新！"
    else
      render :edit
    end
  end

  # 删除 D
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "该条记录已删除！"
    redirect_to admin_jobs_path
  end

  # 显示 / 隐藏
  def publish
    @job = Job.find(params[:id])
    @job.publish!
    redirect_to :back
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!
    redirect_to :back
  end

  # private def
  private
    def job_params
      params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email)
    end
end
