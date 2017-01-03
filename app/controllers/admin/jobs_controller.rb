class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @jobs = current_user.jobs
  end
end
