class JobsController < ApplicationController

  def index

    case params[:order]
    when 'by_min_salary'
      @jobs = Job.where(hide:false).order("salaryMin DESC")
    when 'by_max_salary'
      @jobs = Job.where(hide:false).order("salaryMax DESC")
    else
      @jobs = Job.where(hide:false).order("created_at DESC")
    end
  end

  def show
    # render plain: params.inspect
    @job = Job.find(params[:id])
    if @job.hide
      redirect_to jobs_path
    end
  end

  def new
    flash[:warning] = "You can create job!"
    redirect_to jobs_path
  end

  def create
    flash[:warning] = "You can create job!"
    redirect_to jobs_path
  end

  def edit
    flash[:warning] = "You can edit job!"
    redirect_to jobs_path
  end

  def destroy
    flash[:warning] = "You can delete job!"
    redirect_to jobs_path
  end

end
