class WelcomeController < ApplicationController
  def index
    flash[:notice] = "say 'Hi'"
    flash[:alert] = "say 'Hi'"
    flash[:warning] = "say 'Hi'"
  end
end
