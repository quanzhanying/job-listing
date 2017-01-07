class JobsController < ApplicationController
  # before_filter C & D
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # 首页 R
  def index
    @jobs = Job.where(:is_hidden => false).recent
  end

  # 查看 R
  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      flash[:warning] = "该条记录属于档案，无法查看！"
      redirect_to root_path
    end
  end

  # 新建 C
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

  # 编辑 U
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

  # 删除 D
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "该条记录已删除！"
    redirect_to jobs_path
  end

  # private def
  private
    def job_params
      params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
    end
end
