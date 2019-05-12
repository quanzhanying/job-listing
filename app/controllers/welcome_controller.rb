class WelcomeController < ApplicationController
  def index
    flash[:notice] = "biu! biu!"
  end
end
