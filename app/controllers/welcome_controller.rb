class WelcomeController < ApplicationController
  def index
    flash[:notice] = "zaoan nihao"
  end
  
end
