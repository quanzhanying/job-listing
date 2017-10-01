class Admin::JobsController < ApplicationController
  def index
    @jobs = current_user.jobs
  end
end
