class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    flash[:notice] = "ceshi"
  end
end
