class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :hide, :publish]
  before_action :require_is_admin
  layout "admin"

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
    @resumes = @job.resumes.order("created_at DESC").paginate( page: params[:page], per_page: 10)
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
      redirect_to admin_jobs_path, notice: "Job successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, alert: "Job deleted."
  end

  def hide
    @job = Job.find(params[:id])
    unless @job.is_hidden
      @job.hide!
      flash[:alert] =  "Job has been hidden."
    else
      flash[:warning] = "Job already hidden."
    end
    redirect_to :back
  end

  def publish
    @job = Job.find(params[:id])
    if @job.is_hidden
      @job.publish!
      flash[:notice] = "Job has been published."
    else
      flash[:warning] = "Job already published."
    end
    redirect_to :back
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
  end
end
