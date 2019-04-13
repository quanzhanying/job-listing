class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout 'admin'

  def index
    @jobs = Job.all.recent.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @job = Job.find(params[:id])
    @resumes = @job.resumes
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to admin_jobs_path, notice: "Create Success"
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
      redirect_to admin_jobs_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def toggle_hidden
    @job = Job.find(params[:id])
    @job.is_hidden = !@job.is_hidden
    @job.save
    redirect_back(fallback_location: admin_jobs_path)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = '職缺已刪除'
    redirect_back(fallback_location: root_path)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end

end
