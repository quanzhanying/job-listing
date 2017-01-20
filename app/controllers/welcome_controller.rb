class WelcomeController < ApplicationController
  def index
    flash[:notice] = "祝你找到合适的工作！"
  end
end
