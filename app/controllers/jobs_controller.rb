class JobsController < ApplicationController
  
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :check_permission , only: [:edit, :update, :destroy]

  def index
    @jobs = Job.all.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path, notice: "Create Success"
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
      redirect_back(fallback_location: root_path)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = '職缺已刪除'
    redirect_back(fallback_location: root_path)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def check_permission
    @job = Job.find(params[:id])
    if @job.user != current_user
      redirect_to jobs_path, alert: "You don't have permission!"
    end
  end
    
end
