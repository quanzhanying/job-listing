class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
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
    @job.save
    redirect_to jobs_path
  end

  def update
    @job = Job.find(params[:id])

    @job.update(job_params)

    redirect_to jobs_path, notice: "Upadate Success"
  end

  def destroy
    @group = Job.find(params[:id])
    @group.destroy
    redirect_to jobs_path, alert: "Job deleted"
  end

private

def job_params
  params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
end

end
