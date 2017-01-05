class WelcomeController < ApplicationController
  def index
    flash[:warning] = "good morning"
  end
end
