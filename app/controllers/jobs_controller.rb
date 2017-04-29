class JobsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create,:edit,:update,:destroy,:join,:quit]

  def index
    @jobs=case params[:order]
    when 'by_lower_bound'
      Job.published.order("wage_lower_bound DESC")
    when 'by_upper_bound'
      Job.published.order("wage_upper_bound DESC")
    else
      Job.published.recent
    end
  end

  def show
    @job=Job.find(params[:id])
    @resumes=@job.resumes
    if @job.is_hidden
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
  end
  end

  def edit
    @job=Job.find(params[:id])
  end

  def update
    @job=Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path,notice: "Update Success"
    else
      render :edit
    end
  end

  def new
    @job=Job.new
  end

  def create
    @job=Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job=Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path,notice: "Deleted  "
  end
  def chaxun
    @jobs=Job.find(params[:id]).user.jobs
  end

  def join
    @job=Job.find(params[:id])
    if !current_user.is_shoucang_of?(@job)
      @job.shoucangzhes << current_user
      flash[:notice] = "添加至收藏！"
    end
    redirect_to jobs_path
  end

  def quit
    @job=Job.find(params[:id])
    if current_user.is_shoucang_of?(@job)
      @job.shoucangzhes.delete(current_user)
      flash[:warning] = "取消收藏"
    end
    redirect_to jobs_path
  end
  private

  def job_params
    params.require(:job).permit(:title,:description,:wage_upper_bound, :is_hidden,:wage_lower_bound, :contact_email)
  end



end
