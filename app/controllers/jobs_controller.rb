class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update ,:destroy]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      redirect_to root_path, notice: '职缺修改成功。'
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
      redirect_to root_path, alert: '职缺删除成功。'
  end

private

  def job_params
    params.require(:job).permit(:title,:description)
  end

end
