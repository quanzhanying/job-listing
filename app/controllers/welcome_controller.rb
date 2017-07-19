class WelcomeController < ApplicationController
  def index
    flash[:notice] = "好好学习天天向上！"
  end
end
