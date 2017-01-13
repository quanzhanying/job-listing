class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good Night!"
  end
end
