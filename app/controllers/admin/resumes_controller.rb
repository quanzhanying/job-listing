class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  layout "admin"

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes
  end

  def show
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
  end

end
