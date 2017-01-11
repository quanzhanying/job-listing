class JobsController < ApplicationController
before_action :authenticate_user!, only: [:new,:create, :update, :edit, :destroy]

def index
  @jobs= Job.all
end

 def show
  @job=Job.find(params[:id])
end

def new
  @job = Job.new
end

def create
  @job = Job.new(job_parmas)
  if @job.save
    redirect_to jobs_path , notice: "Job created "

  else
     render :new
  end
end

def edit
  @job= Job.find(params[:id])
end

def update
  @job=Job.find(params[:id])
  if @job.update(job_parmas)
    redirect_to jobs_path
    flash[:notice]="Update success"
  else
    render :edit
  end
end

def destroy
  @job=Job.find(params[:id])
  @job.destroy
  redirect_to jobs_path
  flash[:alert]= "Job deleted"
end

private

def job_parmas
  params.require(:job).permit(:title, :description , :wage_lower_bound, :wage_upper_bound, :contact_email)
end
end
