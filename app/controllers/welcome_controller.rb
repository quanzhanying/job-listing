class WelcomeController < ApplicationController
  def index
    flash[:notice] = "全世界，晚安！"
  end
end
