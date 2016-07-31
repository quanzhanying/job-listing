class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_filter :require_is_admin

  def show
    @admin_job = Job.find(params[:id])
  end

  def index
    @admin_jobs = Job.all
  end

  def new
    @admin_job = Job.new
  end

  def create
    @admin_job = Job.new(job_params)

    if @admin_job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @admin_job = Job.find(params[:id])
  end

  def update
    @admin_job = Job.find(params[:id])
    if @admin_job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @admin_job = Job.find(params[:id])

    @admin_job.destroy

    redirect_to admin_jobs_path
  end

  private


end
