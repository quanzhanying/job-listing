class JobsController < ApplicationController

  before_action :authenticate_user! , only: [:new]
  def index
     @jobs = Job.all
  end

  def new
      @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end

  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to jobs_path,notice: "Update success!"

  end
  private

  def job_params
    params.require(:job).permit(:title,:description)

  end
end
