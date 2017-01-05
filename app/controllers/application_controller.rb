class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    unless current_user.admin?
      flash[:alert] = "You have no permission"
      redirect_to root_path
    end
  end
end
