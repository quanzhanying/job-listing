class Admin::JobsController < ApplicationController
  def index
    @jobs=Job.all.order("created_at DESC")
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
    flash[:notice]="新增成功"
    redirect_to admin_jobs_path
  end
  
  def edit
    @job=Job.find(params[:id])
  end
  def update
    @job=Job.find(params[:id])
    @job.update(job_params)
    flash[:notice]="修改成功"
    redirect_to admin_jobs_path
  end
  
  def destroy
    @job=Job.find(params[:id])
    @job.destroy
    flash[:alert]="删除成功"
     redirect_to admin_jobs_path
  end
  
  private
  def job_params
    #字段白名单。在这里permit的字段在页面操作才能生效。
    #is_hide在下面的params中定义了参数，所以进行new、edit操作时，也是由上面的new/create、edit/update action响应！！不需要单独定义action。check和input组件是一样处理的！不要思维定势。
    #一般自定义的按钮操作才需要单独定义action。
    params.require(:job).permit(:title,:description,:salary_max,:salary_min,:contact_email,:is_hide)
  end
  
end
