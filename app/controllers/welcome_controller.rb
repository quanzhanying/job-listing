class WelcomeController < ApplicationController
  def index
    flash[:warning] = "这是warning信息！"
  end
end
