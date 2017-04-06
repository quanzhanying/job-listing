class JobsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:create,:edit,:update,:destroy]

  def index
    @jobs = Job.where(:is_hidden =>false).order("created_at DESC")
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)
   if @job.save
    redirect_to jobs_path,notice:"Job Added!"
   else
    render :new
   end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path,alert:"Job Deleted!"
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
   if @job.update(jobs_params)
    redirect_to jobs_path,notice:"Job Updated!"
   else
    render :edit
   end
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
    end
  end
  private
  def jobs_params
    params.require(:job).permit(:title,:description,:wage_upper_bound, :wage_lower_bound, :contact_email,:is_hidden)
  end
end
