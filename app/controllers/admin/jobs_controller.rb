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
  ###以下是在controller里直接操作数据库，当然也可以；但是访问model里方法，model再访问数据库更好！！！！！###  
    #注意对表字段赋值后，必须要save才真正存到数据库！
    # @job.is_hide=true
    #@job.save
    #直接update这一个字段也可以，优点是一行代码就搞定
    # @job.update(is_hide:"true")
  
  end
  
  def setOpen
    @job=Job.find(params[:id])
    @job.setOpen!
    redirect_to admin_jobs_path
  end
  
  private
  def job_params
    #字段白名单。在这里permit的字段：页面的新增、修改操作才能写入数据库。
    #页面上新增、修改job的属性时都是由上面的new/create、edit/update action响应（包括is_hide属性，虽然是radio组件。不需要单独定义action响应）！！
    params.require(:job).permit(:title,:description,:salary_max,:salary_min,:contact_email,:is_hide)
    #require(:).permit()的作用：为了防止攻击者修改你其他column。这个过滤器限制了只接受那些字段。打个比方，user下有name、age。你只想让用户更改age，   然而用户如果懂点技术实际上可以修改之后把name也提交给你 如果这时你没过滤 就被修改了name
  end
  
end
