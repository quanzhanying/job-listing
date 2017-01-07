class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good Moring! Hello!"
  end
end
