class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    unless  current_user.isAdmin?
       flash[:alert] = "You are not administrator"
       redirect_to root_path
    end
  end

end
