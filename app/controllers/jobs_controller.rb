class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_job, only: [:edit, :update, :destroy, :show]

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

  def edit

  end

  def show

  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    flash[:alert] = "Job deleted!"
    redirect_to jobs_path

  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
