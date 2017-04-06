class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def index

  end

  private

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end

end
