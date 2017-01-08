class JobsController < ApplicationController

 before_filter :authenticate_user! , only: [:new, :create, :update, :edit, :destroy]
 before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @jobs=Job.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @job=Job.find(params[:id])
  end

  def edit
    @job=Job.find(params[:id])
  end


  def new
    @job=Job.new
  end

  def create
    @job=Job.new(job_params)
    @job.user=current_user

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update

    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy

    @job.destroy
    flash[:alert]="Job deleted"
    redirect_to jobs_path
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert]="You are not admin!"
      redirect_to root_path
    end
  end

private

def find_job_and_check_permission
  @job=Job.find(params[:id])

  if current_user != @job.user
    redirect_to root_path, alert: "You have no permission!"
  end
end

def job_params
  params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
end

end
