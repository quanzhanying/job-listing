class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  layout 'admin'
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    if @job.hidden
      redirect_to jobs_path, alert: "you have no right to see."
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      flash[:notice] = "create success"
      redirect_to admin_jobs_path
    else
      flash[:warning] = "something wrong"
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
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

  def publish
    @job = Job.find(params[:id])
    @job.publish!
    redirect_to :back
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!
    redirect_to :back
  end

  private
  def job_params
    params.require(:job).permit(:title,:description, :hidden, :wage_lower_bound, :wage_upper_bound,:contact_email)
  end
end
