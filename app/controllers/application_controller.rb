class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private

  def after_sign_in_path_for(user)
    request.env['omniauth.origin'] || stored_location_for(user) || root_url
  end

  def after_sign_out_path_for(user)
    request.referer
  end
end
