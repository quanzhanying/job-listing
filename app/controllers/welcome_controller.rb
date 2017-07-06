class WelcomeController < ApplicationController
  def index
    flash[:notice] = "你好！欢迎来到job-Listing!"
  end
end
