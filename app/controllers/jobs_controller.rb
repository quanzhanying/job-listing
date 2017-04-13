class JobsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :crete, :edit, :update, :destroy]
  before_action :find_job_and_vaildate, :only => [:edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user =  current_user

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @job.update(job_params)
    redirect_to jobs_path
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :description)
  end

  def find_job_and_validate
    @job = Job.find(params[:id])
  end

end
