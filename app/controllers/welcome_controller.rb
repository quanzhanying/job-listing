class WelcomeController < ApplicationController
  def index
    flash[:alert] = "Good night!"
  end
end
