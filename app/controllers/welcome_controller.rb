class WelcomeController < ApplicationController
  def index
  flash[:notice] = "天气不错！你好啊！"
  end
end
