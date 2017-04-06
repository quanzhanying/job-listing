class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Morning"
  end
end
