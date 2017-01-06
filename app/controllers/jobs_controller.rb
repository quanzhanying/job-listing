class JobsController < ApplicationController
  before_filter :authenticate_user! ,only: [:new,:create,:edit,:destroy]
  def index
    @jobs = Job.where(:is_hidden =>false).order("created_at DESC")
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
    if @Job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      redirect_to jobs_path,alert: "Job delete"
 end
 end

private
def job_params
  params.require(:job).permit(:title,:description,:wage_upper_bound,:wage_lower_bound,:contact_email,:is_hidden)
end
end
