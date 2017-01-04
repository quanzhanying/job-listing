class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hello! Morning!"
  end
end
