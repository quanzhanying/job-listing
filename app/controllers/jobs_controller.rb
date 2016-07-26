class JobsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_paramas)
    if @job.save
      redirect_to jobs_path, notice: "Job Create Success."
    else
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_paramas)
      redirect_to jobs_path, notice: "Job Update Success."
    else
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def destroy
    @job = Job.find(:first)
    @job.destroy
    redirect_to jobs_path, alert: "Job Del Success."
  end

  private

  def job_paramas
    params.require(:job).permit(:title, :description)
  end


end
