class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_filter :require_is_admin
  layout 'admin'
  def index
    @jobs = Job.all.recent
  end
  def new
    @job = Job.new
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
     redirect_to admin_jobs_path, notice: 'Update Success!'
   else
     render :edit
   end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.delete
      redirect_to admin_jobs_path, alert: 'Job Deleted!'
    end
  end

  def show
    @job = Job.find(params[:id])
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
  params.require(:job).permit(:title, :description, :wage_min, :wage_max, :email, :is_hidden)
end
def require_is_admin
  if !current_user.admin?
    redirect_to root_path, alert: 'You are not admin!'
  end
end
end
