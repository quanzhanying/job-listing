class Admin::JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = admin_jobs_path
  end
end
