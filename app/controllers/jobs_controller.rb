class JobsController < ApplicationController
before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @jobs = Job.all
  end

  def new
    @job=Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
    redirect_to jobs_path
  else
    render :new
  end
  
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update
    redirect_to jobs_path, notice:"Update success"

  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, alert:"Job deleted"
  end



end

private

def job_params
  params.require(:job).permit(:title,:description, :wage_lower_bound, :wage_upper_bound, :contact_email)
end
