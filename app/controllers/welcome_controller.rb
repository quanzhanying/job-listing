class WelcomeController < ApplicationController

  def index
    flash[:alert] = "keep on fighting"
  end
end
