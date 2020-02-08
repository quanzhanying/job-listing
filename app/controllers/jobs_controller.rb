class JobsController < ApplicationController
  
  before_action :authenticate_user!, only:[:new,:create,:edit,:update,:destroy]
  
  def index
    #params[:order]--url中传入的参数order！！！点击后在 rails s 的日志里面也会看到order参数传进来
    @order=params[:order]
    if @order=="by_salary_min"
      @jobs=Job.where(:is_hide => false).order("salary_min DESC")
    elsif @order=="by_salary_max"
      @jobs=Job.where(:is_hide => false).order("salary_max DESC")
    else
      @jobs=Job.where(:is_hide => false).order("created_at DESC")
    end
  end
  ##上面一段：相比在view中过滤掉被隐藏的职位，controller里过滤更优雅和合理-where()
  
  
  
  def show
    #params[:id]--url中传入的参数！！！如/jobs/7,:id就=7，然后find(7)，是根据表里的id=7查询
    @job=Job.find(params[:id])
    #防止直接通过url访问隐藏的职位
    if @job.is_hide
      flash[:warning]="这个职位已不开放"
      redirect_to root_path
    end
  end
  
  # def new
 #    @job=Job.new
 #  end
 #  def create
 #    @job=Job.new(job_params)
 #    @job.save
 #    redirect_to jobs_path
 #  end
 #
 #  def edit
 #    @job=Job.find(params[:id])
 #  end
 #  def update
 #    @job=Job.find(params[:id])
 #    @job.update(job_params)
 #    redirect_to jobs_path
 #  end
 #
 #  def destroy
 #    @job=Job.find(params[:id])
 #    @job.destroy
 #    flash[:alert]="职位删除成功"
 #    redirect_to jobs_path
 #  end
  
  # def setHide
  #    @job=Job.find(params[:id])
  #    @job.setHide
  # end
  #
  # def setShow
  #    @job=Job.find(params[:id])
  #    @job.setShow
  # end
  
  
  # private
 #  def job_params
 #    params.require(:job).permit(:title,:description,:salary_max,:salary_min,:contact_email,:is_hide)
 #  end
  
  
  
  
  
end
