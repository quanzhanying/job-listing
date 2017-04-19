class JobsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :crete, :edit, :update, :destroy]
  before_action :find_job_and_check_permission, only:[:edit,:show,:update,:destroy]

  def index
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.where(:is_hidden => false ).order('wage_lower_bound desc')
    when 'by_upper_bound'
      Job.where(:is_hidden => false ).order('wage_upper_bound desc')
    else
      Job.where(:is_hidden => false).recent
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user =  current_user

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
    if @job.is_hidden
      flash[:warning] = "This job already archived"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    @job.update(job_params)
    redirect_to jobs_path
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title,:description,:wage_upper_bound,:wage_lower_bound,:contact_email,:is_hidden)
  end

  def find_job_and_check_permission
    @job = Job.find(params[:id])
  end

end
