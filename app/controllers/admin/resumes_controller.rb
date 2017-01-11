class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "sidebar"

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.recent
  end
end
