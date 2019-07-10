class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private

  def after_sign_in_path_for(user)
    request.env['omniauth.origin'] || stored_location_for(user) || jobs_url
  end

  def after_sign_out_path_for(user)
    request.referer
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '你誰阿，不是管理員，給我滾~'
      redirect_to root_path
    end
  end

end
