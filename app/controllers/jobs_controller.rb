class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update, :create]
  before_action :find_job_and_checkout_permission, only: [:edit, :destroy, :update]
  def index
    @jobs = Job.all.recent
  end

  def new
    @job = Job.new
  end

  def edit


  end

  def show
    @job = Job.find(params[:id])
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

  def update

    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update success."
    else
      render :edit
    end
  end

  def destroy

    @job.destroy
    redirect_to jobs_path, alert: "Job deleted."
  end

  private
  def job_params
    params.require(:job).permit(:title, :description)
  end

  def find_job_and_checkout_permission
    @job = Job.find(params[:id])

    if current_user != job.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

end
