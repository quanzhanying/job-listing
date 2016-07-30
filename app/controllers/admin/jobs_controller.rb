class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

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
      # puts "--------------"
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, alert: "Job Delete Success."
  end

  def open
    @job = Job.find(params[:id])
    @job.open!
    redirect_to :back
    # if @job.update_columns(is_hidden: "false")
    #   redirect_to admin_jobs_path, notice: "Open Job Success."
    # else
    #   redirect_to admin_jobs_path, notice: "Open Job Failed."
    # end
  end

  def close
    @job = Job.find(params[:id])
    @job.close!
    redirect_to :back
    # if @job.update_columns(is_hidden: "true")
    #   redirect_to admin_jobs_path, notice: "Close Job Success."
    # else
    #   redirect_to admin_jobs_path, notice: "Close Job Failed."
    # end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end
end
