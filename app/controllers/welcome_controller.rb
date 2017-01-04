class WelcomeController < ApplicationController
    before_action :authenticate_user! , only: [:new]
    
  def index
   flash[:warning] = "这是 warning 讯息！"
  end
end
