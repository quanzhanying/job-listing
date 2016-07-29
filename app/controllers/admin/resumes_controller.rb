class Admin::ResumesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin

  layout 'admin'

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.order('created_at DESC')
  end
end
