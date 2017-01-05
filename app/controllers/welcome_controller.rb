class WelcomeController < ApplicationController
  def index
    flash[:notice] = "完成Flash功能"
  end
end
