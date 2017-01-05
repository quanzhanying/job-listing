class JobsController < ApplicationController
before_filter :authenticate_user!, only: [:new,:create,:update,:edit,:destroy]
protect_from_forgery with: :exception
  def index
  @jobs= Job.all
  end

  def show
  @job = Job.find(params[:id])
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
  @job =Job.find(params[:id])

  if @job.update(job_params)
  redirect_to jobs_path
  else
    render :edit
  end

  end




  def destroy
  @job = Job.find(params[:id])
  @job.destroy

  redirect_to jobs_path

  end


  def require_is_admin
  #if current_user.email !="1@2"
  unless current_user.admin?
    flash[:alert] = "You are not admin"
    redirect_to root_path
  end
  end




private

def job_params
params.require(:job).permit(:title,:description)
end




end
