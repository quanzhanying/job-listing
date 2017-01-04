class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  # 首页
  def index
    @jobs = Job.all
  end

  # 管理员确认
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "你不是管理员！"
      redirect_to root_path
    end
  end
end
