class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Goog Morning!"
  end
end
