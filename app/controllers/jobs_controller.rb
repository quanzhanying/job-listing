class JobsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      redirect_to jobs_path, alert: "Your operation have been denied."
    end
  end

  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              @jobs = Job.show_public.order('wage_upper_bound DESC')
            when 'by_upper_bound'
              @jobs = Job.show_public.order('wage_lower_bound DESC')
            else
              @jobs = Job.all.show_public.recent
            end
    if current_user && current_user.admin?

      redirect_to admin_jobs_path
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      redirect_to jobs_path, notice: "Job Create Success."
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
      redirect_to jobs_path, notice: "Job Update Success."
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, alert: "Job Del Success."
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end


end
