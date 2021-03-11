class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end 

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.save

      redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
