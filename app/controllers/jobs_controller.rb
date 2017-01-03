class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @jobs = Job.all
  end
  def new
    @job = Job.new
  end
  def show
    @job = Job.find(params[:id])
  end
  def edit

  end
  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end
  def update

    if @job.update(job_params)
    redirect_to jobs_path, notice: "Update Success"
  else
    render :edit
  end
  end
  def destroy

    @job.destroy
    redirect_to jobs_path, alert: "Job deleted"
  end
  private
  def find_job_and_check_permission
  @job = Job.find(params[:id])

  if current_user != @job.user
    redirect_to root_path, alert: "You have no permission."
  end
end
  def job_params
    params.require(:job).permit(:title, :description)
  end
end
