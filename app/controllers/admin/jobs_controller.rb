class Admin::JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = current_user.participated_jobs
  end
end
