class WelcomeController < ApplicationController
  def index
    flash[:notice] = "你好棒！继续加油！"
  end
end
