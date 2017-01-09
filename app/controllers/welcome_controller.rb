class WelcomeController < ApplicationController
  def index
    flash[:notice] = '欢迎来到我的招聘网'
  end
end
