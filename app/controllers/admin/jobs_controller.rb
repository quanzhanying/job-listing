class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :require_is_admin

  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
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

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "更新职缺成功！"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy
      redirect_to admin_jobs_path, notice: "删除职缺成功! "
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
