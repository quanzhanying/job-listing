class WelcomeController < ApplicationController
  def index
    flash[:notice] = "hi, archer"
  end
end
