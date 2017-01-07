class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good morning!"
    flash[:alert] = "Good morning!"
    flash[:warning] = "Good morning!"
  end
end
