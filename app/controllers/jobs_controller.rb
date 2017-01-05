class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update, :create]
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
     if @job.delete
       redirect_to jobs_path
     end
  end

  def show
    @job = Job.find(params[:id])
  end

  private
  def job_params
    params.require(:job).permit(:title, :description)
  end
end
