class Admin::JobsController < ApplicationController
  #before_action=before_filter?
  before_action :authenticate_user!, only:[:new,:create,:edit,:update,:destroy]
  before_filter :require_admin
  layout "admin"

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
  
  def setHide
    @job=Job.find(params[:id])
    #调用model层的对应方法
    @job.setHide!
    #必须要重定向到当前页面，否则页面不会刷新！上面更改的字段值不会马上反映到页面！
    redirect_to admin_jobs_path
  ###以下是在controller里直接操作数据库，当然也可以，但是访问model里方法，model再访问数据库更好！！！！！###  
    #注意对表字段赋值后，必须要save才真正存到数据库！
    # @job.is_hide=true
    #@job.save
    #直接update这一个字段也可以，优点是一行就搞定
    # @job.update(is_hide:"true")
  
  end
  
  def setOpen
    @job=Job.find(params[:id])
    @job.setOpen!
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
