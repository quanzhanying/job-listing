class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @jobs = current_user.created_jobs
  end

  private

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin. Get away from here!"
      redirect_to root_path
    end
  end
end
