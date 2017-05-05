class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :require_is_admin
  layout "admin"


  def index
    @jobs = Job.all.order("created_at DESC")
  end

  def show
    @job = Job.find(params[:id])

    @hash = Gmaps4rails.build_markers(@job) do |job, marker|
      marker.lat job.latitude
      marker.lng job.longitude
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to admin_jobs_path, notice: "新建职位成功！"
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
      redirect_to admin_jobs_path, notice: "编辑职位成功！"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, notice: "删除职位成功！"
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
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden, :category, :company, :city, :address, :longitude, :latitude)
  end

end
