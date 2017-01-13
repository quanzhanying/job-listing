class WelcomeController < ApplicationController
  def index
    # flash[:notice] = "Good Night!"
    flash[:notice] = "每天都能有所收获，人生就是幸福的!"
  end
end
