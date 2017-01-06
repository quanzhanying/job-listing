class Admin::JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.find(job_params)
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
