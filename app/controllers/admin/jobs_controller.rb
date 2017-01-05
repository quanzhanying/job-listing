class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :require_is_admin

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "create job successful"
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "update job successful"
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash[:alert] = "delete successful"
    redirect_to admin_jobs_path
  end

  def require_is_admin
    #if current_user.email != 'elizachen34@gmail.com'
    unless current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end

  private

    def job_params
      #params.require(:job).permit(:title, :description)
      params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email)
    end

end
