class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def require_id_admin
    if !current_user.admin?
      redirect_to root_path, alert: "You aren't admin"
    end
  end
end
