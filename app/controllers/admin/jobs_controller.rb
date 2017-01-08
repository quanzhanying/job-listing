class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :udpate, :edit, :destroy]
  before_action :require_is_admin

  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
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
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "udpate successfully"
    else
      render :edit
    end

  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to admin_jobs_path, alert: "deleted successfully"

  end

  def require_is_admin

    if current_user.emaile != 'nata@growth.school'
      flash[:alert] = "you are not admin"
      redirect_to root_path
    end

  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end



end
