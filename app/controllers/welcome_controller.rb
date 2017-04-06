class WelcomeController < ApplicationController
  def index
    flash[:notice] = "hello!"

  end
end
