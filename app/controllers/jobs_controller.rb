class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)
    @job.save
    redirect_to jobs_path,notice:"Job Added!"
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path,alert:"Job Deleted!"
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(jobs_params)
    redirect_to jobs_path,alert:"Job Updated!"
  end

  def show
    @job = Job.find(params[:id])
  end
  private
  def jobs_params
    params.require(:job).permit(:title,:description)
  end
end
