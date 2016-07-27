class JobsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      current_user.join!(@job)
      redirect_to jobs_path
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
      redirect_to jobs_path, notice: "Job updated"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, notice: "Job deleted"
  end

  def require_is_admin
  if current_user.admin?
    flash[:alert] = 'You are not admin'
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
