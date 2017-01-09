class ResumesController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def created
    @job = Job.find(parms[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user
  end

  private

  def resume_params
    params.require(:resume).permit(:job_id, :user_id)
  end
  
end
