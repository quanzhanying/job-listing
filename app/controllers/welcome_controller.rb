class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hi, welcome to Lynkle Offer!"
  end
end
