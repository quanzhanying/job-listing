class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    #
    # render plain: params.inspect
    # return

    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Create job successful."
      redirect_to root_path
    else
      flash[:error] = "Failed to create job."
      redirect_to root_path
    end
  end

  def edit
    @job = Job.find(params[:id])
    if @job.blank?
      flash[:error] = "Job don't exist"
      redirect_to jobs_path
    end
  end

  def update

    @job = Job.find(params[:id])
    if @job
       if @job.update(job_params)
         flash[:notice] = "Update Job successful."
         redirect_to jobs_path
       else
         flash[:error] = "Failed to update job."
          redirect_to jobs_path
       end
    else
    end
  end

  def show
    render plain: params.inspect

    # @job = Job.find(params[:id])
  end


  def destroy
    @job = Job.find(params[:id])
    if @job.blank?
      flash[:warning] = "Failed to remove job, can't find job."
      redirect_to jobs_path
    else
      flash[:notice] = "Delete job successful."
      redirect_to jobs_path
    end

  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :salaryMax, :salaryMin, :contact, :hide)
  end


end
