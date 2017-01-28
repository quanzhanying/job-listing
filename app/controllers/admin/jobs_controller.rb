class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
#  before_filter :require_is_admin

  def index
    @jobs = Job.all
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

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to jobs_path, notice: '职位修改成功！'
#   if @job.update(job_params)
#       redirect_to jobs_path, notice: '职位修改成功'
#   else
#       render :edit
#   end
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "职位成功删除"
    redirect_to jobs_path
  end


#  def require_is_admin
#    if !current_user.admin?
#      flash[:alert] = 'You are not admin'
#      redirect_to root_path
#    end
#  end


  private

  def job_params
   params.require(:job).permit(:title, :description)
  end

end
