class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    flash[:notice] = "This is Job-Listing"
  end
end
