class WelcomeController < ApplicationController
  def index
    flash[:alert] = "Handsome boy~"
  end
end
