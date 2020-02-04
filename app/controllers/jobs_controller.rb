class JobsController < ApplicationController
  
  before_action :authenticate_user!, only:[:new,:create,:edit,:update,:destroy]
  
  def index
    #相比在view中过滤，controller里过滤更优雅和合理
    @jobs=Job.where(:is_hide => false).order("created_at DESC")
  end
  
  def show
    @job=Job.find(params[:id])
  end
  
  def new
    @job=Job.new
  end
  def create
    @job=Job.new(job_params)
    @job.save
    redirect_to jobs_path
  end
  
  def edit
    @job=Job.find(params[:id])
  end
  def update
    @job=Job.find(params[:id])
    @job.update(job_params)
    redirect_to jobs_path
  end
  
  def destroy
    @job=Job.find(params[:id])
    @job.destroy
    flash[:alert]="职位删除成功"
    redirect_to jobs_path
  end
  
  #is_hide在下面的params中定义了参数，所以进行new、edit操作时，也是由上面的new/create、edit/update action响应！！不需要单独定义action。check和input组件是一样处理的！不要思维定势。
  #一般自定义的按钮操作才需要单独定义action。
  # def setHide
  #    @job=Job.find(params[:id])
  #    @job.setHide
  # end
  #
  # def setShow
  #    @job=Job.find(params[:id])
  #    @job.setShow
  # end
  
  
  private
  def job_params
    params.require(:job).permit(:title,:description,:salary_max,:salary_min,:contact_email,:is_hide)
  end
  
  
  
  
  
end
