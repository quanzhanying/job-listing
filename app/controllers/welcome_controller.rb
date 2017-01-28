class WelcomeController < ApplicationController
  def index
    flash[:notice] = "元气满满！"
  end
end
