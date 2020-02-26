class ResumesController < ApplicationController
  
  
  def new
    #第一行别忘记了，因为该action的路由里有job_id这个参数！
    @job=Job.find(params[:job_id])
    @resume=Resume.new
  end
  def create
    @job=Job.find(params[:job_id])
    @resume=Resume.new(resume_params)
    #新建时“所属用户”、“所属职位”等字段虽然表单里没有，但要赋值直接插入数据库；而编辑时由于表单中没有这些字段、修改不了，所以不用赋值！！
    @resume.job=@job
    @resume.user=current_user
    @resume.save
    redirect_to job_path(@job)
  end
  

  
  
  def resume_params
    params.require(:resume).permit(:content,:attachment)
  end
  
  
end
