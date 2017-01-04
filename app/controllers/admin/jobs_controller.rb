class Admin::JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job  = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.find(params[:id])
    if @job.save
      redirect_to  admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])

  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path,notice: "Update success!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash[:alert] = "Job deleted!"

    redirect_to admin_jobs_path
  end

  private

  def job_params

    params.require(:job).permit(:title,:description)
  end

end
