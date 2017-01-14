class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :edit, :create, :update, :destroy]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              Job.where(is_hidden: false).order('wage_lower_bound DESC')
            when 'by_upper_bound'
              Job.where(is_hidden: false).order('wage_upper_bound DESC')
            else
              Job.where(:is_hidden => false).order("created_at DESC")
            end 
  end
  def new
    @job = Job.new
  end
  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
  flash[:warning] = "This Job already archieved"
  redirect_to root_path
end
end

  def edit
    @job = Job.find(params[:id])
  end
  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
    redirect_to root_path
  else
    render :new
  end
  end
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
      redirect_to root_path
  end
  private
  def find_job_and_check_permission
    @job = Job.find(params[:id])

    if current_user != @job.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
  end
end
