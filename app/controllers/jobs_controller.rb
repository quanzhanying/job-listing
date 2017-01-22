class JobsController < ApplicationController
before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
    end 
  end

  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

def new
  @job = Job.new
end

def edit
  @job = Job.find(params[:id])
end

def create
  @job = Job.new(job_params)

  if @job.save
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
  redirect_to jobs_path, alert: "Job Deleted"
end

private

def job_params
  params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
end

end
