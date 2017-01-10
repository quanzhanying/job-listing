class JobsController < ApplicationController
 before_filter :authenticate_user! , only: [:new, :create, :update, :edit, :destroy]
  def index


    @jobs = case params[:oder]
    when 'by_lower_bound'
      Job.publish.order('wage_lower_bound DESC' )
    when 'by_upper_bound'
      Job.publish.order('wage_upper_bound DESC')
    else
     Job.publish.recent
    end
  end

  def show
    @job=Job.find(params[:id])
    if @job.is_hidden
      flash[:warning]="This Job already archieved"
      redirect_to root_path
    end
  end

  def new
  @job=Job.new
end

def edit
  @job = Job.find(params[:id])
end

def destroy
  @job =Job.find(params[:id])
  @job.destroy
    redirect_to jobs_path , alert: "Job deleted"
  end

def update
  @job=Job.find(params[:id])
  if @job.update(job_params)
    redirect_to jobs_path
    flash[:notice]= "Update success"
  else
    render :edit
end
end

def create
  @job=Job.create(job_params)
  if @job.save
    redirect_to jobs_path , notice:"Add job successfuly "
  else
    render :new
  end
end

private
def job_params
  params.require(:job).permit(:title , :description , :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
end
end
