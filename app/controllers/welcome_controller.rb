class WelcomeController < ApplicationController
  def index
    flash[:warning] = "这是warning讯息！"
  end
end
