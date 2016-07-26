class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :require_is_admin

  def index
    @jobs = Job.all
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
      redirect_to admin_jobs_path, notice: "Admin Add Job Success."
    else
      # puts @job.errors.messages
      # puts "++++++++++++++++++++++++"
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "Admin Update Success."
    else
      puts "--------------"
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, alert: "Job Delete Success."
  end

  private

  def require_is_admin
    if !current_user.admin?(current_user.email)
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
