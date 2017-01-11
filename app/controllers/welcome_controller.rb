class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎！！"
  end
end
