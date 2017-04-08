class Admin::JobsController < ApplicationController

  def index
    if current_user
      @jobs = current_user.jobs
    else
      redirect_to jobs_path
    end
  end
end
