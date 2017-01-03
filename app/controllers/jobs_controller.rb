class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.find(job_params)
    if @job.save
      flash[:notice] = "create successful"
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(job_params)
    if @job.update
      flash[:notice] = "update successful"
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.delete
    flash[:alert] = "delte OK"
    redirect_to jobs_path
  end

private
   def job_params

   end
end
