class WelcomeController < ApplicationController
  def index
    flash[:warning] = "Hi! Warning!"
  end
end
