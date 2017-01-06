class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!,only: [:new,:create,:update,:edit,:destroy]
  before_filter :require_is_admin
  layout "admin"

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
    if @job.update(job_params1)
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

  def public
    @job = Job.find([params[:id]])
    @job.is_hidden_1 = false
    @job.save
    redirect_to admin_jobs_path
  end

  def hide
    @job = Job.find([params[:id]])
    @job.is_hidden_1 = true
    @job.save
    redirect_to admin_jobs_path
  end
  private

  def job_params1
    params.require(:job).permit(:title,:description,:wage_lower_bound,:wage_upper_bound,:contact_email,:is_hidden,:is_hidden_1)
  end

end
