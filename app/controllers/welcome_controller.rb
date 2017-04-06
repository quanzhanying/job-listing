class WelcomeController < ApplicationController
  def index
    flash[:alert] = "页面已经做好了"
  end
end
