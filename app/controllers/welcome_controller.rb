class WelcomeController < ApplicationController
  def index
    flash[:notice] = "加油 努力干"
    flash[:warning]= "jwyb nuligj"
    flash[:alert] = "jy ujg"
  end
end
