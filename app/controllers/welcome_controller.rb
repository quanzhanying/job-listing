class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hello! Morning!"
    #flash[:alert] = "Time to sleep!"
  end
end
