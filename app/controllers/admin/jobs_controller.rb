class Admin::JobsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create,:update,:edit,:destroy]
  before_action :require_is_admin
  before_action :find_job,only:[:edit,:update,:destroy,:publish,:hide]

  layout "admin"

  def index
    @jobs = Job.all.order("created_at DESC")
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit

  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path, alert: "Job deleted!"
  end

  def publish
    @job.is_hidden = false
    if @job.save
      flash[:notice] = "Public Success！"
    else
      flash[:warning] = "Public Fail"
    end

    redirect_to admin_jobs_path
  end

  def hide
    @job.is_hidden = true
    if @job.save
      flash[:notice] = "Hide Success！"
    else
      flash[:notice] = "Hide Success！"
    end

    redirect_to admin_jobs_path
  end

  private



  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title,:description,:wage_upper_bound,:wage_lower_bound,:is_hidden,:contact_email)
  end

end
