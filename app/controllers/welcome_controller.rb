class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good Morning!"
  end
end
