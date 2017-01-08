class ApplicationController < ActionController::Base
  before_action :authenticate_user! , only: [:new]
  protect_from_forgery with: :exception
end
