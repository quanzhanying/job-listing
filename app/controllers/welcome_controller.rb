class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good Morning! Hello!"
  end
end
