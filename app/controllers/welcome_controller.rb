class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good night!"
  end
end
