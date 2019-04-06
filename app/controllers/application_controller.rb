class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  after_filter :store_location, only: [:after_sign_in_path_for]

  private

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(user)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(user)
    request.referer
  end
end
