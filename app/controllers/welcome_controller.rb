class WelcomeController < ApplicationController
  def index
    flash[:notice] = "晚安"
  end
end
