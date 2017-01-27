class WelcomeController < ApplicationController
  def index
    flash[:notice] = "温馨提示:欢迎来到一块视听"
  end
end
