class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Jobs.all
  end

  def new
    @job.new
  end

  def create
    @job.new(job_params)

    if @job.save
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
    @job.update(job_params)
    redirect_to admin_jobs_path
  end
end

  def destroy
    @job = Job.find(params)
    @job.destroy

    redirect_to admin_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
