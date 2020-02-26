class Admin::ResumesController < ApplicationController
  
  def index
    @job=Job.find(params[:job_id])
    #根据has_many获取
    @resumes=@job.resumes
    #下面这种方式不够优雅
    # @resumes=Resume.where(job_id:@job.id)
  end
  
  
  #自定义action-下载简历，没用到：
  def download
     @job=Job.find(params[:job_id])
     @resume=Resume.find(params[:id])
     @path=@resume.attachment_url
     send_file(@path)
  end
  
  
end
