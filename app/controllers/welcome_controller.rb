class WelcomeController < ApplicationController
  def index
    flash[:alert] = "全栈工程师的网站！"
  end
end
