class Admin::ResumesController < ApplicationController
  before_filter :authenticate_user!, only: [:index]

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.order('created_at DESC')
  end
end
