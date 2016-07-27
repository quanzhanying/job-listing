class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]
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
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @job.update(job_params)
      redirect_to jobs_path, notice: "You've already update the fucking job"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, alert: "Deleted"
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def find_job_and_check_permission
    @group = Job.find(params[:id])

    if current_user != @job.user
      redirect_to root_path, alert: "Fuck! You have no permission."
    end
  end

end
