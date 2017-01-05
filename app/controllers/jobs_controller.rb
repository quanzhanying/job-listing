class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :Destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
