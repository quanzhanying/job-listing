class WelcomeController < ApplicationController
  def index
    flash[:warning] = "你好！早安！"
  end
end
