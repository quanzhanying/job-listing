class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def require_is_admin
    if !current_user.admin?
      redirect_to root_path, alert: "You have no permission."
    end
  end
  
  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      admin_jobs_path
    else
      jobs_path
    end
  end
end
