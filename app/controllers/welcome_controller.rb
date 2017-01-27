class WelcomeController < ApplicationController
  def index
    flash[:notice] = "新春快乐！"
  end
end
