class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def index
    @job = Job.all
  end

  def edit
    @job = Job.find(params[:id])
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

    @job.destroy

    redirect_to job_path
  end

  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  
end
