class WelcomeController < ApplicationController
  def index
    flash[:notice] = "good job!"
  end
end
