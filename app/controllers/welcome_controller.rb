class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good job!"
  end
end
