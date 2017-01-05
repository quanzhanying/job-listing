class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_hidden, only: [:show]

  def index
    #@jobs = Job.all
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      flash[:notice] = "create successful"
      redirect_to jobs_path
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
      flash[:notice] = "update successful"
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "delte OK"
    redirect_to jobs_path
  end

private
   def check_hidden
     @job = Job.find(params[:id])

     if @job.is_hidden == true
       redirect_to root_path, alert: "You have no permission to see hidden jobs"
     end
   end

   def job_params
     params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
   end
end
