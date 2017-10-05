class Admin::JobsController < ApplicationController

  before_action :get_job_id, :only =>[:show, :edit, :destroy, :update]
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @jobs = current_user.jobs.order("created_at DESC")
  end

  def require_is_admin
    unless current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  def new
    @admin_job = Job.new
  end

  def create
    @admin_job = Job.new(job_params)
    @admin_job.user = current_user
    if @admin_job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @admin_job.update(job_params)
      redirect_to admin_jobs_path, notice: 'update job success'
    else
      render :edit
    end
  end

  def destroy
    @admin_job.destroy
    redirect_to admin_jobs_path, alert: 'delete job-list success'
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :salary_max, :salary_min, :is_hidden, :email)
  end

  def get_job_id
    @admin_job = Job.find(params[:id])
  end
end
