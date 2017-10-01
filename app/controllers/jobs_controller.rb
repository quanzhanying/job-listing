class JobsController < ApplicationController
  before_action :get_job_id, :only =>[:show, :edit, :destroy, :update]

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
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: 'update job success'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, alert: 'delete job-list success'
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def get_job_id
    @job = Job.find(params[:id])
  end
end
