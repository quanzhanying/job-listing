class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_param)
    @job.save

    redirect_to jobs_path
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_param)

    redirect_to jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_param
    params.require(:job).permit(:title, :description)
  end

end
