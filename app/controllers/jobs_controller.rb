class JobsController < ApplicationController

  before_action :authenticate_user! , only: [:new,:create,:update,:edit,:destroy]

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
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to jobs_path,notice: "Update success!"

  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Job deleted!"
    redirect_to jobs_path

  end

  def require_is_admin

    unless current_user.admin?
      flash[:alert] = "You are not admin!"
      redirect_to root_path
    end

  end




  private




  def job_params
    params.require(:job).permit(:title,:description)

  end
end
