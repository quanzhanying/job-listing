class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Notice!"
    flash[:alert] = "Alert!"
    flash[:warning] = "Warning!"
  end
end
