class JobsController < ApplicationController

  def show
    @jobs = Jon.find(params[:id])
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def created
    @job = Job.new(job_params)

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
