class JobsController < ApplicationController
before_action :authenticate_user!, only: [:new,:create, :update, :edit, :destroy]




def index


  @jobs=  case params[:order]
  when 'by_lower_bound'
    Job.published.order('wage_lower_bound DESC').paginate(page: params[:page], per_page: 5)
    # 该行代码表示按照“薪资下限排列”，每页显示5条信息，超过5条自动分页
  when 'by_upper_bound'
    Job.published.order('wage_upper_bound DESC').paginate(page: params[:page], per_page: 5)

  when
  Job.published.recent.paginate(page: params[:page], per_page: 5)
else
  Job.published.recent.search(params[:search]).paginate(page: params[:page], per_page: 5)
end


end

 def show
  @job=Job.find(params[:id])
  if @job.is_hidden
    flash[:warning] = "This Job already archieved"
    redirect_to root_path
  end
end

def new
  @job = Job.new
end

def create
  @job = Job.new(job_params)
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
  if @job.update(job_params)
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

def job_params
  params.require(:job).permit(:title, :description , :is_hidden, :wage_lower_bound, :wage_upper_bound, :contact_email)
end
end
