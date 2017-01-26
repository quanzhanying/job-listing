class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :require_is_admin
  layout "admin"
  def index
    @jobs = Job.all
  end
  def new
    @job = Job.new
  end
  def show
    @job = Job.find(params[:id])
  end
  def edit
    @job = Job.find(params[:id])
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
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :is_qianduan, :is_houduan, :is_quanzhan, :is_chanpin, :is_mishu, :is_shouhou, :is_yunxing, :is_ceshi, :name, city_ids:[])
  end
end
