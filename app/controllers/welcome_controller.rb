class WelcomeController < ApplicationController
  def index
    flash[:warning] = "this is a warning message！"
  end
end
