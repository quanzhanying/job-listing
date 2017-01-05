class WelcomeController < ApplicationController
  def index
    flash[:alert] = "哇哈哈！我是全栈工程师！"
  end
end
