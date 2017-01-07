class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @jobs = Job.where(:is_hidden => false).recent
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
     redirect_to jobs_path, notice: 'Update Success!'
   else
     render :edit
   end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.delete
      redirect_to jobs_path, alert: 'Job Deleted!'
    end
  end

  def show
    @job = Job.find(params[:id])
    if job.is_hidden
      redirect_to jobs_path, warning: 'This job is already archieved!'
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :wage_min, :wage_max, :email, :is_hidden)
  end

end
