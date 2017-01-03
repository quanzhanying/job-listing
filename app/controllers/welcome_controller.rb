class WelcomeController < ApplicationController
  def index
    flash[:notice] = "我是温馨提示"
  end
end
