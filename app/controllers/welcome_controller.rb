class WelcomeController < ApplicationController
  def index
    flash[:warning] = "Good morning"
  end
end
