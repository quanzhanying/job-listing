class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good Evening！Hello！"
  end
end
