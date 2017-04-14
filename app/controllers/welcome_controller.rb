class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Nice to see you!"
  end
end
