class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]


  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "这个职位已归档！不可查看！"
      redirect_to root_path
    end
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path, notice: "新建职位成功！待管理员审核！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: "更新职位成功！"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: "删除职位成功！"
  end

  def admin
  end


  private

  def find_job_and_check_permission
    @job = Job.find(params[:id])

    if current_user != @job.user
      redirect_to root_path, alert: "你没有权限修改！"
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email)
  end


end
