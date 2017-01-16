class WelcomeController < ApplicationController
  def index
    flash[:warning] = "warning"
  end
end
