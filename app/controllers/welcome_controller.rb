class WelcomeController < ApplicationController
  def index
    flash[:notice] = "fighting!"
  end
end
