class WelcomeController < ApplicationController
  def index
    flash[:warning] = "早安！您好！"
  end
end
