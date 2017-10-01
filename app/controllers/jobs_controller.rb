class JobsController < ApplicationController
  before_action :get_job_id, :only =>[:show, :edit, :destroy, :update]
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_filter :require_is_admin, only: [:new, :create, :update, :edit, :destroy]

  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: 'update job success'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, alert: 'delete job-list success'
  end

  def require_is_admin
    unless current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :salary_max, :salary_min, :is_hidden)
  end

  def get_job_id
    @job = Job.find(params[:id])
  end
end
