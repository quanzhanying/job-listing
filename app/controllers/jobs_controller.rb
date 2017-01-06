class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs =Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job =Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def eidt
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email)
  end

  def require_is_admin
    if current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

end
