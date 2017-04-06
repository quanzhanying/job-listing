class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  def index
    @jobs = Job.where(is_hidden: false).order(created_at: "DESC")
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
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Update success"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Job deleted"
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, 
                               :wage_upper_bound, :contact_email)
  end
end
