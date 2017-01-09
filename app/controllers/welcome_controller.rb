class WelcomeController < ApplicationController
  def index
    flash[:notice]= "欢迎来到job listing"
  end
end
