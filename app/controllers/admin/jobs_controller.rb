class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  def index
    @jobs = current_user.released_jobs
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :hidden, :wage_lower_bound, :wage_upper_bound,:contact_email)
  end
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin."
      redirect_to root_path
    end
  end
end
