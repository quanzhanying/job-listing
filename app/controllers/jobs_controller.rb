class JobsController < ApplicationController

  before_action :authenticate_user! , only: [:new,:create,:update,:edit,:destroy]

  def index
     @jobs = Job.where(:is_hidden_1 => false ).order("created_at DESC")

  end

  def new
      @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end

  end

  def show
    @job = Job.find(params[:id])
    if @job.is_hidden_1
     flash[:warning] = "This Job already archieved"
     redirect_to root_path
   end

  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to jobs_path,notice: "Update success!"

  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Job deleted!"
    redirect_to jobs_path

  end


  private

  def job_params
    params.require(:job).permit(:title,:description,:wage_lower_bound,:wage_upper_bound,:contact_email,:is_hidden_1)

  end
end
