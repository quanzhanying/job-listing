class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :index]
  before_action :require_is_admin
  before_action :find_job, only: [:edit, :update, :destroy, :show]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path, notice: "New job created"
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "Update Success!"
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path, alert: "Deleted!"
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
  end


end
