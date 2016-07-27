class Admin::JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = current_user.created_jobs
    if !current_user.require_is_admin(@jobs)
      redirect_to root_path
      flash[:warning] = "你不是admin，无法查看My Jobs，滚！"
    end
  end
end
