class WelcomeController < ApplicationController
  def index
    flash[:notice] = "世界，你好！"
  end
end
