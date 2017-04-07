class WelcomeController < ApplicationController
  def index
    flash[:alert] =  "早安！你好！"
  end
end
