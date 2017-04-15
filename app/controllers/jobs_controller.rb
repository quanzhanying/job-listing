class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @jobs = Job.where(:is_hidden=>false).recent.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params_job)
    if @job.save
      redirect_to jobs_path, notice: "Job created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @job.update(params_job)
    if @job.save
      redirect_to jobs_path, notice: "Update success"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: "Job deleted"
  end

  private
  def find_job_and_check_permission
    @job = Job.find(params[:id])

    # if current_user != @job.user
    #   redirect_to root_path, alert: "You have no permission"
    # end
  end

  def params_job
    params.require(:job).permit(:title,:description,:wage_upper_bound,
                                :wage_lower_bound,:contact_email,:is_hidden)
  end

end
