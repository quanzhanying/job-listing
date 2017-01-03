class WelcomeController < ApplicationController

  def index
    flash[:notice] = "good morning"
  end
end
