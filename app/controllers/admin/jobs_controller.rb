class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @jobs = current_user.jobs
  end

  def show
    @job = Job.finde(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @Job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  # def update
  #   @job = Job.find(params[:id])
  #   if @job.update(job_params)
  #     redirect_to jobs_path,notice: "Update Success"
  #   else
  #     render :edit
  #   end
  # end

  def destroy
   @job = Job.find(params[:id])
   @job.destroy
   redirect_to admin_jobs_path, alert: "Job deleted"
  end

  def require_is_admin
    unless current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
