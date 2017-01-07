class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    flash[:notice] = "Good morning!"
    flash[:alert] = "Good morning!"
    flash[:warning] = "Good morning!"
  end
end
