class WelcomeController < ApplicationController
  def index
    flash[:notice] = "祝开心！"
  end
end
