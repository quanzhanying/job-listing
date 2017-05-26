class Admin::JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  layout "admin"
  def index
    @jobs = current_user.jobs.order("created_at DESC")
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, alert: "你已经成功删除职位！"
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "你不是公司HR，没有权限进行相关操作！"
      redirect_to jobs_path
    end
  end

  def publish
    @job = Job.find(params[:id])
    @job.is_hidden = false
    @job.save
    redirect_to :back
  end

  def hide
    @job = Job.find(params[:id])
    @job.is_hidden = true
    @job.save
    redirect_to :back
  end
end
