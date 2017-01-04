class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new,:create,:update,:edit,:destroy]
  before_filter :require_is_admin
  def index
    @jobs = Job.where(:is_hidden => false).order("created_at")
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end

private

def job_params
    params.require(:job).permit(:title, :description,:wage_upper_bound,:wage_lower_bound,:contact_email)
  end

end
