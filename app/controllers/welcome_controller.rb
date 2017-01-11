class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good Job!"
  end
end
