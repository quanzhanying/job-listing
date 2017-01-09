class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @jobs = Job.where(:is_hidden => false)
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

     if @job.save!
       redirect_to jobs_path
     else
       render :new
     end
    end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Success"
    else
      render :edit
    end

  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path, alert: "Job deleted"
  end

  def require_is_admin

    if !current_user.admin?
      flash[:alert] = "you are not admin"
      redirect_to root_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email,:is_hidden)
  end

end
