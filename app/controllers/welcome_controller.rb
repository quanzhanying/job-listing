class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Welcome to XYZ!"
  end
end
