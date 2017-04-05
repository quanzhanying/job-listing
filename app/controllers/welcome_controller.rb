class WelcomeController < ApplicationController
  def index
    flash[:notice] = "text"
    flash[:warning] = "text"
    flash[:alert] = "text"
  end
end
