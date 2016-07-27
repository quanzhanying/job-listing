class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update , :destroy]
  before_filter :require_is_admin

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      redirect_to admin_jobs_path, alert: "the job is hidden"
    else
      render :show
    end
  end

  def index
    @jobs = Job.all
  end

  def edit
    @job = Job.find(params[:id])
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
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end

  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy
    redirect_to admin_jobs_path
  end

  def change_hidden
    @job = Job.find(params[:id])

    if @job.is_hidden
      is_hidden = false
    else
      is_hidden = true
    end
    if @job.update_column(:is_hidden , is_hidden)
      redirect_to admin_jobs_path , notice: "Update Success"
    end
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email,:is_hidden)
  end

end
