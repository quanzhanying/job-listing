class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "admin"


  def index
    @jobs = Job.order("created_at DESC")
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

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to admin_jobs_path, notice: '职位修改成功(admin)！'
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path, notice: '职位建立成功（admin）'
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "职位成功删除（admin）"
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
   params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end

end
