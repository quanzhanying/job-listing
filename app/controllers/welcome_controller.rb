class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hi Hi!"
  end
end
