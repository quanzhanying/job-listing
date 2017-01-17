class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  layout 'admin'

  def index
    @job = Job.find(params[:id])
    @resume = @job.resumes.order('created_at DESC')
  end
end
