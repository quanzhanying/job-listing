class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def require_id_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end
end
