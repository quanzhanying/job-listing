class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # 管理员确认
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "你不是管理员！"
      redirect_to root_path
    end
  end
end
