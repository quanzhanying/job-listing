class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_filter :require_is_admin
  layout "admin"

  def show
    @admin_job = Job.find(params[:id])
    if @admin_job.is_hidden
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
    end
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

  def publish
      @job = Job.find(params[:id])
      @job.is_hidden = false
      @job.save
      redirect_to :back
    end

    def hide
      @job = Job.find(params[:id])
      @job.is_hidden = true
      @job.save
      redirect_to :back
    end

  private


end
