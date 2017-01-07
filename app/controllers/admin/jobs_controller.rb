class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  def index
    @jobs = current_user.released_jobs
  end

  def edit
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path
  end

  private
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin."
      redirect_to root_path
    end
  end
end
