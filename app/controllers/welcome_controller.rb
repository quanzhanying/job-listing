class WelcomeController < ApplicationController
  def index
    flash[:notice]= "是时候开启新的征程了!"
  end
end
